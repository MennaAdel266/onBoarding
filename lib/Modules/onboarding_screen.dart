import 'package:flutter/material.dart';
import 'package:project/Modules/login_screen.dart';
import 'package:project/Shared/components/components.dart';
import 'package:project/Shared/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel
{
  final String image;
  final String title;
  final String body;

  BoardingModel({
    @required this.image,
    @required this.title,
    @required this.body,
  });
}

class OnBoardingScreen extends StatefulWidget {

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  List <BoardingModel> boarding =[
    BoardingModel(
      image: 'assets/images/coffe1.jpg',
      title: 'Welcome to our coffee',
      body: 'we will offer to you everything you want!',
    ),
    BoardingModel(
      image: 'assets/images/coffee2.jpg',
      title: 'Enjoy with us',
      body: 'come back and enjoy with us on openair garden with your coffee',
    ),
    BoardingModel(
      image: 'assets/images/coffee3.jpg',
      title: 'We always happy with you',
      body: 'Invite your friends to get all offers and enjoy with our vibes',
    ),
  ];

  bool isLast = false;
  void submit ()
  {
    CacheHelper.saveData(key: 'onBoarding', value: true,).then((value) {
      if(value)
      {
        navigateAndFinish(context, LoginScreen(),);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          defaultTextButton(
            function:()
            {
              submit();
            },
            text:'skip',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children:
          [
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                controller: boardController,
                onPageChanged: ( int index)
                {
                  if(index == boarding.length - 1)
                  {
                    setState(() {
                      isLast = true;
                    });
                  }else
                  {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                itemBuilder: (context,index) => buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardController,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    activeDotColor: Colors.brown,
                    dotHeight: 10,
                    expansionFactor: 4,
                    dotWidth: 10,
                    spacing: 5,
                  ) ,
                  count: boarding.length,
                ),
                Spacer(),
                FloatingActionButton(
                  backgroundColor: Colors.brown,
                  onPressed:()
                  {
                    navigateTo(context, LoginScreen());
                    if(isLast)
                    {
                      submit();
                    }else
                    {
                      boardController.nextPage(
                        duration: Duration(
                          milliseconds: 750,
                        ) ,
                        curve: Curves.fastLinearToSlowEaseIn ,
                      );
                    }
                  },
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
      [
        Expanded(
          child: Image(
            image: AssetImage('${model.image}'),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          '${model.title}',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          '${model.body}',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 15,
        ),
      ]
  ) ;   }
