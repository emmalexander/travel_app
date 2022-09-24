import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/large_text.dart';
import 'package:travel_app/widgets/normal_text.dart';
import 'package:travel_app/widgets/responsive_button.dart';

import '../cubit/app_cubits.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = ['welcome-one.png', 'welcome-two.png', 'welcome-three.png'];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height; //802.9090909090909
    double width = MediaQuery.of(context).size.width; //392.72727272727275
    return Scaffold(
      body: PageView.builder(
          itemCount: images.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (_, index) {
            return Container(
              height: double.maxFinite,
              width: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('images/${images[index]}')),
              ),
              child: Container(
                padding: EdgeInsets.only(left: 20, top: 150, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LargeText(text: 'Trips'),
                        NormalText(
                          text: 'Mountains',
                          size: 30,
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: 250,
                          child: NormalText(
                            text:
                                'Mountain hikes give you an incredible sense of freedom along with endurance test',
                            color: AppColors.textColor2,
                            size: 14,
                          ),
                        ),
                        SizedBox(height: 40),
                        GestureDetector(
                            onTap: () {
                              BlocProvider.of<AppCubits>(context).getData();
                            },
                            child: Container(
                                width: 120,
                                child: Row(
                                  children: [
                                    ResponsiveButton(width: 120),
                                  ],
                                ))),
                      ],
                    ),
                    //this column below is the scrolling indicator
                    Column(
                      children: List.generate(3, (indexDots) {
                        //scrolling Dots
                        return Container(
                          margin: EdgeInsets.only(bottom: 2),
                          width: 8,
                          height: index == indexDots ? 25 : 8,
                          decoration: BoxDecoration(
                            color: index == indexDots
                                ? AppColors.mainColor
                                : AppColors.mainColor.withOpacity(.3),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
