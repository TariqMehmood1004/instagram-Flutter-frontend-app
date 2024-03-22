import 'package:instagram/constants/constants.dart';

import '../utils/utils.dart';

class MyCircleImage extends StatelessWidget {
  const MyCircleImage({
    super.key,
    this.imageContainerSize = 70,
    this.radius = 100,
    this.borderWidth = 3,
    this.borderColor = Colors.orangeAccent,
    required this.index,
  });

  final double imageContainerSize;
  final double radius;
  final double borderWidth;
  final Color borderColor;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: imageContainerSize,
      height: imageContainerSize,
      padding: EdgeInsets.all(0.5),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: borderColor, width: borderWidth),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Image.network(
          imageList[index],
          fit: BoxFit.cover,
          width: imageContainerSize,
          height: imageContainerSize,
        ),
      ),
    );
  }
}
