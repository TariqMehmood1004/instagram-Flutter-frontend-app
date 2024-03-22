// ignore_for_file: sized_box_for_whitespace, dead_code, non_constant_identifier_names, prefer_final_fields

import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:instagram/constants/constants.dart';
import '../../utils/utils.dart';
export 'package:path_provider/path_provider.dart';
export 'package:provider/provider.dart';
import 'package:share/share.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  bool isLiked = false;
  List<bool> isLikedList = [];

  void hideHeart(int index) {
    setState(() {
      isLiked = !isLiked;
      if (index >= 0 && index < isLikedList.length) {
        isLikedList[index] = isLiked;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    // Initialize isLikedList with false values
    isLikedList =
        List.generate(10, (index) => false); // Adjust the size as needed
  }

  final screenshotController = ScreenshotController();

  final ScreenshotController _screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              "Instagram",
              style: GoogleFonts.oleoScriptSwashCaps(
                color: Colors.black,
                fontSize: 28,
                fontWeight: FontWeight.normal,
              ),
            ),
            MyIconWidget(
              iconData: CupertinoIcons.chevron_down,
              iconColor: Colors.black,
              iconSize: 18,
              overlayColor: Colors.black12,
              onIconTap: () {},
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          MyIconWidget(
            iconData: CupertinoIcons.heart,
            iconColor: Colors.black,
            onIconTap: () {},
          ),
          MyIconWidget(
            iconData: CupertinoIcons.bolt_circle,
            iconColor: Colors.black,
            onIconTap: () {},
          ),
          SizedBox(width: 10),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: Column(children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        children: List.generate(
                          10,
                          (index) => ImageCardWidget(
                            index: index,
                            onTap: () {
                              setState(() {});
                              showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  useRootNavigator: true,
                                  enableDrag: true,
                                  barrierColor: Colors.black12,
                                  builder: (builder) {
                                    return Container(
                                      height:
                                          MediaQuery.sizeOf(context).height * 1,
                                      width: MediaQuery.sizeOf(context).width,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ),
                                      ),
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                1,
                                            width: MediaQuery.sizeOf(context)
                                                .width,
                                            child: PostImageWidget(
                                              randomImagePath: imageList[index],
                                            ),
                                          ),
                                          Positioned(
                                            top: 40,
                                            right: 10,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white
                                                    .withOpacity(0.2),
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(100),
                                                ),
                                              ),
                                              child: MyIconWidget(
                                                iconData: Icons.close,
                                                onIconTap: () {
                                                  Navigator.pop(context);
                                                },
                                                iconSize: 20,
                                                iconColor: Colors.white,
                                                containerWidthAndHeightSize: 20,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 20,
                                            left: 20,
                                            right: 0,
                                            child: SingleChildScrollView(
                                              physics: BouncingScrollPhysics(),
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      MyCircleImage(
                                                        index: index,
                                                        imageContainerSize: 30,
                                                        borderWidth: 0,
                                                      ),
                                                      SizedBox(width: 10),
                                                      Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.5,
                                                        child: Text(
                                                          userNameList[index]
                                                              .padLeft(10),
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style:
                                                              GoogleFonts.inter(
                                                            color: Colors.white,
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 15,
                                                            vertical: 3),
                                                    decoration: BoxDecoration(
                                                      color: Colors.red
                                                          .withOpacity(0.5),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  100)),
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        MyIconWidget(
                                                          iconData:
                                                              CupertinoIcons
                                                                  .heart_solid,
                                                          onIconTap: () {},
                                                          iconColor:
                                                              Colors.white,
                                                          iconSize: 20,
                                                          containerWidthAndHeightSize:
                                                              20,
                                                        ),
                                                        SizedBox(width: 3),
                                                        Text(
                                                          "10 likes",
                                                          style: GoogleFonts
                                                              .oleoScriptSwashCaps(
                                                            color: Colors.white,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width,
                child: Column(
                  children: List.generate(
                    10,
                    growable: false,
                    (index) => Container(
                      width: MediaQuery.sizeOf(context).width,
                      margin: EdgeInsets.only(top: 10),
                      child: Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            child: GestureDetector(
                              onDoubleTap: () {
                                hideHeart(index);
                                log("isLiked: ${isLikedList[index]} for index: $index");
                              },
                              child: PostImageWidget(
                                  randomImagePath: imageList[index]),
                            ),
                          ),
                          Positioned(
                            top: -2,
                            left: 0,
                            right: 0,
                            child: Container(
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      MyCircleImage(
                                          imageContainerSize: 40, index: index),
                                      SizedBox(width: 10),
                                      Row(
                                        children: [
                                          Text(
                                            "Jacqueline Fernendez",
                                            style: GoogleFonts.inter(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(width: 5),
                                          Icon(
                                            CupertinoIcons.checkmark_seal_fill,
                                            color: Colors.blue,
                                            size: 15,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  MyIconWidget(
                                    iconData: CupertinoIcons.ellipsis_vertical,
                                    iconColor: Colors.black,
                                    onIconTap: () {},
                                    containerWidthAndHeightSize: 30,
                                    iconSize: 14,
                                    backgroundColor: Colors.grey.shade100,
                                    overlayColor: Colors.grey.shade300,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: -2,
                            left: 0,
                            right: 0,
                            child: Container(
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      MyIconWidget(
                                        iconData: isLikedList.isNotEmpty &&
                                                isLikedList[index]
                                            ? CupertinoIcons.heart_solid
                                            : CupertinoIcons.heart,
                                        iconColor: isLikedList.isNotEmpty &&
                                                isLikedList[index]
                                            ? Colors.red
                                            : Colors.black,
                                        onIconTap: () {
                                          hideHeart(index);
                                        },
                                        iconSize: 25,
                                        overlayColor: Colors.grey.shade300,
                                      ),
                                      MyIconWidget(
                                        iconData: CupertinoIcons.bolt_circle,
                                        iconColor: Colors.black,
                                        onIconTap: () {},
                                        iconSize: 25,
                                        overlayColor: Colors.grey.shade300,
                                      ),
                                      MyIconWidget(
                                        iconData: Icons.send_rounded,
                                        iconColor: Colors.black,
                                        onIconTap: () {},
                                        iconSize: 25,
                                        overlayColor: Colors.grey.shade300,
                                      ),
                                    ],
                                  ),
                                  MyIconWidget(
                                    iconData: CupertinoIcons.bookmark,
                                    iconColor: Colors.black,
                                    onIconTap: () async {
                                      takeScreenshotAndShare();
                                      setState(() {});
                                    },
                                    iconSize: 25,
                                    overlayColor: Colors.grey.shade300,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          isLikedList.isNotEmpty && isLikedList[index]
                              ? Visibility(
                                  visible: !isLiked,
                                  maintainState: true,
                                  maintainAnimation: true,
                                  maintainSize: true,
                                  child: AnimatedOpacity(
                                    opacity: 1.0,
                                    duration: Duration(milliseconds: 300),
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 100),
                                      alignment: Alignment.center,
                                      transform: isLiked
                                          ? Matrix4.identity()
                                          : Matrix4.diagonal3Values(
                                              0.1, 0.1, 1.0),
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Transform.scale(
                                          scale: isLikedList.isNotEmpty &&
                                                  isLikedList[index]
                                              ? 1.0
                                              : 1.5,
                                          child: Icon(
                                            CupertinoIcons.heart_solid,
                                            color: Colors.white,
                                            size: 100,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : SizedBox(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }

  void takeScreenshotAndShare() async {
    final image = await _screenshotController.capture();
    if (image != null) {
      final directory = await getTemporaryDirectory();
      final imagePath = '${directory.path}/screenshot.png';
      await File(imagePath).writeAsBytes(image);
      Share.shareFiles([imagePath]);
      log("Screenshot taken and shared");
    }
  }
}

class PostImageWidget extends StatelessWidget {
  const PostImageWidget({
    super.key,
    required this.randomImagePath,
  });

  final String randomImagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: AspectRatio(
        aspectRatio: 1 / 1.6,
        child: Image.network(
          randomImagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    int counter = 0;
    return Container(
      decoration: BoxDecoration(
        border: Border(
            top: BorderSide(
          color: Colors.grey.shade300,
        )),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        currentIndex: counter,
        onTap: (index) {
          counter = index;
          print(counter);
        },
        iconSize: 20,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        items: [
          BottomNavigationBarItem(
            icon: MyIconWidget(
              iconData: Icons.home_filled,
              iconColor: Colors.black,
              iconSize: 25,
              onIconTap: () {},
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: MyIconWidget(
              iconData: CupertinoIcons.search,
              iconColor: Colors.black,
              iconSize: 25,
              onIconTap: () {},
            ),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: MyIconWidget(
              iconData: Icons.add_box_outlined,
              iconColor: Colors.black,
              iconSize: 25,
              onIconTap: () {},
            ),
            label: "Add Post",
          ),
          BottomNavigationBarItem(
            icon: MyIconWidget(
              iconData: Icons.ondemand_video_rounded,
              iconColor: Colors.black,
              iconSize: 25,
              onIconTap: () {},
            ),
            label: "Reels",
          ),
          BottomNavigationBarItem(
            icon: MyCircleImage(
              imageContainerSize: 33,
              borderWidth: 2,
              borderColor: Colors.blueAccent.shade100,
              index: 2,
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
