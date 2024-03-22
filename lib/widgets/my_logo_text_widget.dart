import '../utils/utils.dart';

class MyLogoTextWidget extends StatelessWidget {
  const MyLogoTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "Instagram",
      style: GoogleFonts.oleoScriptSwashCaps(
        color: Colors.black,
        fontSize: 28,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
