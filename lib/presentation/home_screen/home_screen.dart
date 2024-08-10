
import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvp_arch/presentation/home_screen/widgets/back_stack_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../core/utils/app_colors.dart';
import '../../widgets/app_text_widget.dart';
import '../../widgets/dashed_divider.dart';
import 'blocs/watch_bloc.dart';
import 'blocs/watch_event.dart';
import 'blocs/watch_state.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<WatchBloc>().add(LoadWatch());
    return Scaffold(
        backgroundColor: Colors.black,
        body: BlocBuilder<WatchBloc, WatchState>(
            builder: (context, state) {
              if (state is WatchLoaded) {
                return   Stack(
                  children: [
                    const BackStackWidget(),
                    Column(
                      children: [
                        SizedBox(height: 5.5.h,),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal:2.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: (){},
                                icon: CircleAvatar(
                                  radius: 18,
                                  backgroundColor: AppColors.white.withOpacity(0.2),
                                  child: Icon(Icons.menu_rounded,color: AppColors.white,size: 22,),
                                ),
                              ),
                              CustomTextWidget(
                                title: 'Chronos Sphere',
                                color: AppColors.white,
                                fontSize: 5.6.w,
                              ),
                              IconButton(
                                onPressed: (){},
                                icon: CircleAvatar(
                                    radius: 18,
                                    backgroundColor: AppColors.white.withOpacity(0.2),
                                    child: Image(
                                      height:20,
                                      color:AppColors.white,
                                      image: const AssetImage("assets/images/png/cart.png"),
                                    )
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 1.h,),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal:4.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColors.black.withOpacity(0.4)
                                ),
                                child: Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: 2.w,vertical: 0.3.h),
                                  child: Row(
                                    children: [
                                      CustomTextWidget(
                                        title: 'Limited to ',
                                        color: state.watches[state.currentIndex].color,
                                        fontSize: 3.6.w,
                                      ),
                                      CustomTextWidget(
                                        title: '${state.watches[state.currentIndex].availableCount} pieces',
                                        color: Colors.white,
                                        fontSize: 3.6.w,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              CustomTextWidget(
                                title: 'Available',
                                color: state.watches[state.currentIndex].color,
                                fontSize: 4.5.w,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 2.h,),
                        CarouselSlider.builder(
                          itemCount: state.watches.length,
                          options: CarouselOptions(
                              padEnds: true,
                              height: 40.h,
                              enlargeCenterPage: true,
                              viewportFraction: 0.8,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              enlargeFactor:1,
                              enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                              onPageChanged: (index,reason){
                                context.read<WatchBloc>().add(UpdateCurrentIndex(index));
                                context.read<WatchBloc>().pageController.animateToPage(index, duration: const Duration(milliseconds: 1),curve: Curves.ease);
                              }
                          ),
                          itemBuilder: (BuildContext context, int index, int realIndex) {
                            final helmet = state.watches[index];
                            return Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 10.w),
                              child: Image(image: AssetImage(helmet.imageUrl)),
                            );
                          },
                        ),
                        SizedBox(height: 2.h,),
                        Expanded(
                          child: PageView.builder(
                              controller: context.read<WatchBloc>().pageController,
                              itemCount: state.watches.length,
                              itemBuilder: (BuildContext context,int index){
                                return Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        FadeInDown(
                                          from: 20,
                                          child: IconButton(
                                            onPressed: (){
                                              context.read<WatchBloc>().add(OnItemUpdate(index,
                                                {
                                                  'isLiked': !state.watches[index].isLiked,
                                                },
                                              )
                                              );
                                            },
                                            icon: CircleAvatar(
                                                radius: 20,
                                                backgroundColor: AppColors.darkIconColor,
                                                child:state.watches[index].isLiked?
                                                const Image(
                                                  height:22,
                                                  color:Colors.red,
                                                  image: AssetImage("assets/images/png/liked.png"),
                                                ): Image(
                                                  height:22,
                                                  color:AppColors.greyTextColor,
                                                  image: const AssetImage("assets/images/png/unlike.png"),
                                                )
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 2.w,),
                                        FadeInDown(
                                          from: 20,
                                          child: IconButton(
                                            onPressed: (){},
                                            icon: CircleAvatar(
                                                radius: 20,
                                                backgroundColor: AppColors.darkIconColor,
                                                child: Image(
                                                  height:22,
                                                  color:AppColors.greyTextColor,
                                                  image: const AssetImage("assets/images/png/share.png"),
                                                )
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 2.w,),
                                        FadeInDown(
                                          from: 20,
                                          child: IconButton(
                                            onPressed: (){},
                                            icon: CircleAvatar(
                                                radius: 20,
                                                backgroundColor: AppColors.darkIconColor,
                                                child: Image(
                                                  height:22,
                                                  color:AppColors.greyTextColor,
                                                  image: const AssetImage("assets/images/png/doc.png"),
                                                )
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 1.h,),
                                    FadeInUp(
                                        from: 20,child: CustomTextWidget(title: state.watches[index].itemCode,color: AppColors.greyTextColor,fontSize: 4.5.w,)),
                                    SizedBox(height: 1.h),
                                    FadeInUp(
                                        from: 20,
                                        child: CustomTextWidget(title: state.watches[index].name,color: AppColors.white,fontSize: 8.w,fontWeight: FontWeight.w200,)),
                                    SizedBox(height: 2.h),
                                    Padding(
                                      padding:  EdgeInsets.symmetric(horizontal:4.w),
                                      child: Row(
                                        mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                        children: [
                                          MaterialButton(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(25)
                                            ),
                                            elevation: 0,
                                            color:state.watches[index].color,
                                            onPressed: (){

                                            },
                                            child: CustomTextWidget(title: "Buy Now",color: AppColors.black,fontWeight: FontWeight.w600,),
                                          ),
                                          FadeInUp(
                                            from: 20,
                                            child: CustomTextWidget(
                                              title: '${state.watches[index].price} \$',
                                              color: state.watches[index].color,
                                              fontSize: 4.3.w,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 2.h,),
                                    Padding(
                                      padding:  EdgeInsets.symmetric(horizontal:2.w),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          FadeInDown(
                                            from: 20,
                                            child: IconButton(
                                              onPressed: (){

                                              },
                                              icon: CircleAvatar(
                                                  radius: 20,
                                                  backgroundColor: AppColors.darkIconColor,
                                                  child: Image(
                                                    height:22,
                                                    color:AppColors.greyTextColor,
                                                    image: const AssetImage("assets/images/png/watch_left.png"),
                                                  )
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child:  FadeInUp(
                                              from:40,
                                              child: CustomPaint(
                                                painter: DashedLinePainter(),
                                              ),
                                            ),
                                          ),
                                          FadeInDown(
                                            from: 20,
                                            child: IconButton(
                                              onPressed: (){

                                              },
                                              icon: CircleAvatar(
                                                  radius: 20,
                                                  backgroundColor: AppColors.darkIconColor,
                                                  child: Image(
                                                    height:22,
                                                    color:AppColors.greyTextColor,
                                                    image: const AssetImage("assets/images/png/watch_right.png"),
                                                  )
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              }
                          ),
                        )
                      ],
                    ),
                  ],
                );
              }else{
                return Container();
              }
            }
        ),
    );
  }
}


