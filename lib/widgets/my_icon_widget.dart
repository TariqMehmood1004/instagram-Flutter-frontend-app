import '../utils/utils.dart';

class MyIconWidget extends StatelessWidget {
  const MyIconWidget({
    super.key,
    this.margin = 5,
    this.radius = 100,
    this.iconSize = 26,
    required this.iconData,
    required this.iconColor,
    required this.onIconTap,
    this.miniAndMaxSize = 40,
    this.foregroundColor = Colors.black,
    this.containerWidthAndHeightSize = 40,
    this.overlayColor = Colors.transparent,
    this.containerColor = Colors.transparent,
    this.highlightColor = Colors.transparent,
    this.backgroundColor = Colors.transparent,
    this.shape = const CircleBorder(),
  });

  final IconData iconData;
  final Color iconColor;
  final double iconSize;
  final Color highlightColor;
  final Color backgroundColor;
  final Color overlayColor;
  final Color foregroundColor;
  final Color containerColor;
  final double radius;
  final double margin;
  final double containerWidthAndHeightSize;
  final double miniAndMaxSize;
  final CircleBorder shape;
  final Function() onIconTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerWidthAndHeightSize,
      height: containerWidthAndHeightSize,
      margin: EdgeInsets.all(margin),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: IconButton(
        onPressed: onIconTap,
        padding: EdgeInsets.zero,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          overlayColor: MaterialStateProperty.all(overlayColor),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
          shape: MaterialStateProperty.all(shape),
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          alignment: Alignment.center,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize: MaterialStateProperty.all(Size.square(miniAndMaxSize)),
          maximumSize: MaterialStateProperty.all(Size.square(miniAndMaxSize)),
          visualDensity: VisualDensity.compact,
          elevation: MaterialStateProperty.all(0),
          foregroundColor: MaterialStateProperty.all(foregroundColor),
          splashFactory: NoSplash.splashFactory,
          enableFeedback: false,
        ),
        icon: Icon(
          iconData,
          color: iconColor,
          size: iconSize,
        ),
      ),
    );
  }
}
