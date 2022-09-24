import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/cubit/app_cubit_states.dart';
import 'package:travel_app/cubit/app_cubits.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_buttons.dart';
import 'package:travel_app/widgets/large_text.dart';
import 'package:travel_app/widgets/normal_text.dart';
import 'package:travel_app/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 4;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      //so when you want to access something like an image for example, you use this statement below
      DetailState detail = state as DetailState;
      return Scaffold(
        body: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    width: double.maxFinite,
                    height: 350,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'http://mark.bslmeiyu.com/uploads/${detail.place.img}')),
                    ),
                  ),
                ),
                Positioned(
                    top: 30,
                    left: 10,
                    child: Container(
                      padding: const EdgeInsets.only(right: 20),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                BlocProvider.of<AppCubits>(context).goHome();
                              },
                              icon: Icon(
                                Icons.menu,
                                color: Colors.white,
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.more_vert,
                                color: Colors.white,
                              ))
                        ],
                      ),
                    )),
                Positioned(
                    top: 320,
                    child: Container(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                      height: 500,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              LargeText(
                                text: detail.place.name,
                                color: Colors.black.withOpacity(.8),
                              ),
                              LargeText(
                                text: '\$${detail.place.price.toString()}',
                                color: AppColors.mainColor,
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: AppColors.mainColor,
                              ),
                              SizedBox(width: 5),
                              NormalText(
                                text: detail.place.location,
                                color: AppColors.textColor1,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Wrap(
                                children: List.generate(5, (index) {
                                  return Icon(
                                    Icons.star,
                                    color: index < detail.place.stars
                                        ? AppColors.starColor
                                        : AppColors.textColor2,
                                  );
                                }),
                              ),
                              SizedBox(width: 10),
                              NormalText(
                                text: '(${detail.place.stars}.0)',
                                color: AppColors.textColor2,
                              )
                            ],
                          ),
                          SizedBox(height: 20),
                          LargeText(
                            text: 'People',
                            size: 20,
                            color: Colors.black.withOpacity(.8),
                          ),
                          SizedBox(height: 5),
                          NormalText(
                            text: 'Number of people in your group',
                            color: AppColors.mainTextColor,
                          ),
                          SizedBox(height: 10),
                          Wrap(
                            children: List.generate(5, (index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  child: AppButtons(
                                    isIcon: false,
                                    text: (index + 1).toString(),
                                    size: 50,
                                    color: selectedIndex == index
                                        ? Colors.white
                                        : Colors.black,
                                    backgroundColor: selectedIndex == index
                                        ? Colors.black
                                        : AppColors.buttonBackground,
                                    borderColor: selectedIndex == index
                                        ? Colors.black
                                        : AppColors.buttonBackground,
                                  ),
                                ),
                              );
                            }),
                          ),
                          SizedBox(height: 20),
                          LargeText(
                              text: 'Description',
                              color: Colors.black.withOpacity(.8),
                              size: 20),
                          SizedBox(height: 5),
                          NormalText(
                            text: detail.place.description,
                            color: AppColors.mainTextColor,
                          ),
                        ],
                      ),
                    )),
                Positioned(
                    bottom: 20,
                    left: 20,
                    right: 20,
                    child: Row(
                      children: [
                        AppButtons(
                          size: 60,
                          color: AppColors.textColor1,
                          backgroundColor: Colors.white,
                          borderColor: AppColors.textColor1,
                          isIcon: true,
                          icon: Icons.favorite_border,
                        ),
                        SizedBox(width: 20),
                        ResponsiveButton(
                          isResponsive: true,
                        )
                      ],
                    ))
              ],
            )),
      );
    });
  }
}
