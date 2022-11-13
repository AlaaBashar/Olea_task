import 'dart:math';

import 'package:flutter/material.dart';


import '../AllWidgetOnNewsApp/AllWidget.dart';
import '../Constant/ConstantVariable.dart';
import '../FetchApi/DataCardFromApi.dart';
import '../FetchApi/FetchApi.dart';
import 'MoreDetailsPage.dart';

List<Articles>? listModel;
Articles? model;
var index = 0;

class CardTask extends StatefulWidget {
  const CardTask({Key? key}) : super(key: key);

  @override
  _CardTaskState createState() => _CardTaskState();
}

var cardAspectRatio = 12.0 / 18.0;
var widgetAspectRatio = cardAspectRatio * 1.2;

class _CardTaskState extends State<CardTask> {
  int currentSelectedIndex=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
  var currentPage = images.length - 1.0;
  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: images.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page!;
      });
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Text.rich(
          TextSpan(
              text: 'Arts',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: textOfFirstWordAppBar),
              children: <InlineSpan>[
                TextSpan(
                  text: ' News',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: textOfSecondWordAppBar),
                ),
              ]),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 0,
            child: SizedBox(
              height: 110,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: nameAndImageOfCategoricalBar.length,
                  itemBuilder: (_, index) {
                    return CategoricalBar(
                      onSelect: () {
                        setState(() {
                          currentSelectedIndex = index;
                        });
                      },
                      isSelected: currentSelectedIndex == index,
                      index: index,
                    );
                  }),
            ),
          ),
          listModel != null
              ? Stack(
                   children: <Widget>[
                     CardScrollWidget(currentPage),
                     Positioned.fill(
                       child: PageView.builder(
                         itemCount: listModel!.length,
                         controller: controller,
                         reverse: true,
                         itemBuilder: (context, index) {
                           return  GestureDetector(
                               behavior: HitTestBehavior.translucent,
                               onTap: (){
                             Navigator.push(context,
                                 MaterialPageRoute(builder: (_) => MoreDetailsPage(model: listModel![index])));
                               },
                               child:Container()

                           );
                         },
                       ),
                     ),

                   ],
                    )
              : const Center(child: Text("Loading Data ...")),



        ],
      ),
    );
  }

  void loadData() async {
    listModel = await FetchApi.fetchStory();

    setState(() {});
  }


}

// ignore: must_be_immutable
class CardScrollWidget extends StatelessWidget {
  var currentPage;
  var padding = 20.0;
  var verticalInset = 20.0;

  CardScrollWidget(this.currentPage);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(builder: (context, contraints) {
        var width = contraints.maxWidth;
        var height = contraints.maxHeight;

        var safeWidth = width - 2 * padding;
        var safeHeight = height - 2 * padding;

        var heightOfPrimaryCard = safeHeight;
        var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

        var primaryCardLeft = safeWidth - widthOfPrimaryCard;
        var horizontalInset = primaryCardLeft / 2;

        List<Widget> cardList = [];

        for ( index = 0; index < listModel!.length; index++) {
          model = listModel![index];
          var delta = index - currentPage;
          bool isOnRight = delta > 0;

          var start = padding +
              max(
                  primaryCardLeft -
                      horizontalInset * -delta * (isOnRight ? 15 : 1),
                  0.0);

          var cardItem = Positioned.directional(
            top: padding + verticalInset * max(-delta, 0.0),
            bottom: padding + verticalInset * max(-delta, 0.0),
            start: start,
            textDirection: TextDirection.rtl,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Container(
                decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(3.0, 6.0),
                      blurRadius: 10.0)
                ]),
                child: AspectRatio(
                  aspectRatio: cardAspectRatio,
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.network(model!.urlToImage!, fit: BoxFit.cover),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.3),
                                        spreadRadius: 40,
                                        blurRadius: 7,
                                        offset: const Offset(0, 3),
                                      )
                                    ],
                                  ),
                                  child: Text(model!.title!,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              child: Container(
                                child: const Text("4 Nov   2 Min",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 8.0,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
          cardList.add(cardItem);
        }
        return Stack(
          children: cardList,
        );
      }),
    );
  }
}

// SingleChildScrollView(
//   scrollDirection: Axis.horizontal,
//   child: Container(
//     child: Row(
//       children: [
//         CategoricalBar(
//           selected:false,
//           pathOfImage:
//           ImageAndNameOFCategoricalBar.pathOfGeneralImage,
//           nameOfCategorical:
//           ImageAndNameOFCategoricalBar.nameOfGeneralImage,
//         ),
//         CategoricalBar(
//           pathOfImage:
//           ImageAndNameOFCategoricalBar.pathOfEventImage,
//           nameOfCategorical:
//           ImageAndNameOFCategoricalBar.nameOfEventImage,
//         ),
//         CategoricalBar(
//           pathOfImage:
//           ImageAndNameOFCategoricalBar.pathOfTheatersImage,
//           nameOfCategorical: ImageAndNameOFCategoricalBar
//               .nameOfExhibitionImage,
//         ),
//         CategoricalBar(
//           pathOfImage: ImageAndNameOFCategoricalBar
//               .pathOfExhibitionImage,
//           nameOfCategorical:
//           ImageAndNameOFCategoricalBar.nameOfTheatersImage,
//         ),
//         CategoricalBar(
//           pathOfImage:
//           ImageAndNameOFCategoricalBar.pathOfPoliticalImage,
//           nameOfCategorical:
//           ImageAndNameOFCategoricalBar.nameOfPoliticalImage,
//         ),
//
//
//       ],
//     ),
//   ),
// ),
//     listModel != null ? InkWell(
//   onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_) => MoreDetailsPage(model: model))),
//   child: Container(
//     child: Column(
//       children: <Widget>[
//         Stack(
//           children: <Widget>[
//             CardScrollWidget(currentPage),
//             Positioned.fill(
//               child: PageView.builder(
//                 itemCount: listModel.length,
//                 controller: controller,
//                 reverse: true,
//                 itemBuilder: (context, index) {
//                   return Container();
//                 },
//               ),
//             )
//           ],
//         ),
//       ],
//     ),
//   ),
// )
// :Center(child:Text("Loading Data ...")),
