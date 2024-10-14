part of 'package:identicon_generator/ui/screens/home/home_screen.dart';

final _iconKey = GlobalKey();

class _IconShowcase extends StatelessWidget {
  const _IconShowcase();

  @override
  Widget build(BuildContext context) => BlocBuilder<IconBloc, IconState>(
        builder: (context, state) => state.prompts.isEmpty
            ? const SizedBox.shrink()
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 12.0 * 2,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: RepaintBoundary(
                        key: _iconKey,
                        child: CustomPaint(
                          painter: _IconPainter(
                            code: _generateHashCode(
                              input: state.prompts,
                              hashFunction: state.hashFunction,
                            ),
                            gridType: state.gridType,
                            useRandomColors: state.useRandomColors,
                            colors: state.colors,
                            marginRatio: state.marginRatio,
                          ),
                          size: Size.square(state.size /
                              MediaQuery.of(context).devicePixelRatio),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      );

  BigInt _generateHashCode({
    required String input,
    required SupportedHashFunction hashFunction,
  }) {
    final bytes = utf8.encode(input);

    return BigInt.parse(
        switch (hashFunction) {
          SupportedHashFunction.md5 => md5.convert(bytes),
          SupportedHashFunction.sha1 => sha1.convert(bytes),
          SupportedHashFunction.sha224 => sha224.convert(bytes),
          SupportedHashFunction.sha256 => sha256.convert(bytes),
          SupportedHashFunction.sha384 => sha384.convert(bytes),
          SupportedHashFunction.sha512 => sha512.convert(bytes),
          SupportedHashFunction.hmacMd5 =>
            Hmac(md5, utf8.encode(hashFunction.name)).convert(bytes),
          SupportedHashFunction.hmacSha256 =>
            Hmac(sha256, utf8.encode(hashFunction.name)).convert(bytes),
        }
            .toString(),
        radix: 16);
  }
}

class _IconPainter extends CustomPainter {
  const _IconPainter({
    required this.code,
    required this.gridType,
    required this.useRandomColors,
    required this.colors,
    required this.marginRatio,
  });

  final BigInt code;
  final int gridType;
  final bool useRandomColors;
  final IconColor colors;
  final double marginRatio;

  @override
  void paint(Canvas canvas, Size size) {
    double gridSize;
    double margin = 0.0;
    if (marginRatio == 0.0) {
      gridSize = size.width / gridType;
    } else {
      margin = size.width * (marginRatio / 100) / 2;
      gridSize = (size.width - margin * 2) / gridType;
    }

    final backgroundPaint = Paint()..color = colors.backgroundColor;
    canvas.drawRect(
        Rect.fromLTWH(0, 0, size.width, size.height), backgroundPaint);

    Color pixelColor;
    if (useRandomColors) {
      pixelColor = Color.fromARGB(
        255,
        ((code & BigInt.from(0xFF0000)) >> 16).toInt(),
        ((code & BigInt.from(0x00FF00)) >> 8).toInt(),
        (code & BigInt.from(0x0000FF)).toInt(),
      );
      if (pixelColor == colors.backgroundColor) {
        pixelColor = colors.pixelColor;
      }
    } else {
      pixelColor = colors.pixelColor;
    }
    final pixelPaint = Paint()
      ..color = pixelColor
      ..isAntiAlias = false;

    BigInt copy = code;
    for (int y = 0; y < gridType; y++) {
      for (int x = 0; x < (gridType / 2).ceil(); x++) {
        final shouldPaint = (copy & BigInt.from(1)).toInt() == 1;
        if (shouldPaint) {
          canvas.drawRect(
            Rect.fromLTWH(
              x * gridSize + margin,
              y * gridSize + margin,
              gridSize,
              gridSize,
            ),
            pixelPaint,
          );
          canvas.drawRect(
            Rect.fromLTWH(
              (gridType - 1 - x) * gridSize + margin,
              y * gridSize + margin,
              gridSize,
              gridSize,
            ),
            pixelPaint,
          );
        }
        copy = copy >> 1;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
