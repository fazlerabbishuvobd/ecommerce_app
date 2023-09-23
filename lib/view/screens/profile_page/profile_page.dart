import 'package:ecommerce_app/resources/assets/app_icon/app_icons.dart';
import 'package:ecommerce_app/resources/routes/app_routes_name.dart';
import 'package:ecommerce_app/utils/app_style.dart';
import 'package:ecommerce_app/viewmodel/profile_page/profile_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final getController = Get.put(ProfilePageViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.all(AppStyle.padding10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                        onPressed: (){
                          Get.toNamed(AppRouteName.settingPage);
                        },
                        icon: const Icon(Icons.settings)
                    )
                ),
                AppStyle.height10,

                /// Profile Images
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        debugPrint("bottom model sheet");
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(AppStyle.padding5),
                        height: Get.height*0.15,
                        width: Get.height*0.15,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(85),
                            child: Image.network('https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg',
                              height: Get.height,
                              fit: BoxFit.fitHeight,
                            )
                        ),
                      ),
                    ),
                    AppStyle.width20,

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Fazle Rabbi",style: AppStyle.playFontBold.copyWith(fontSize: 18),),
                        Text("+08801767364544",style: AppStyle.playFont16),
                        Text("frs.cse@gmail.com",style: AppStyle.playFont16),
                      ],
                    ),
                  ],
                ),
                AppStyle.height20,

                /// Check Balance
                Obx(() {
                  return GestureDetector(
                    onTap: () {
                      getController.isCheckBalance.value = true;
                    },
                    child: Center(
                      child: AnimatedContainer(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.amber,
                        ),
                        height: Get.height*0.05,
                        width: getController.isCheckBalance.value? Get.width*0.7:Get.width*0.5,
                        padding: const EdgeInsets.all(AppStyle.padding5),
                        duration: const Duration(seconds: 1),
                        onEnd: () {
                          Future.delayed(const Duration(seconds: 2)).then((value) {
                            getController.isCheckBalance.value = false;
                          });
                        },
                        child: Text(getController.isCheckBalance.value? "Balance: 45602350.00 TK":"Tap to Show Balance",style: AppStyle.playFont16Bold,),
                      ),
                    ),
                  );
                }),
                AppStyle.height30,

                /// Order Amount
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// Total Order
                    CustomContainer(
                      height: Get.height*0.08,
                      width: Get.width*0.3,
                      color: Colors.green,
                      widget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("546",style: AppStyle.playFont16Bold,),
                          const Text("Total Order"),
                        ],
                      ),
                    ),

                    /// Received Order
                    CustomContainer(
                      height: Get.height*0.08,
                      width: Get.width*0.3,
                      color: Colors.blueAccent,
                      widget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("540",style: AppStyle.playFont16Bold,),
                          const Text("Received"),
                        ],
                      ),
                    ),

                    /// Cancel Order
                    CustomContainer(
                      height: Get.height*0.08,
                      width: Get.width*0.3,
                      color: Colors.red,
                      widget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("06",style: AppStyle.playFont16Bold,),
                          const Text("Cancel"),
                        ],
                      ),
                    ),

                  ],
                ),
                AppStyle.height30,

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("My Orders",style: AppStyle.playFont16Bold,),
                    Text("View All",style: AppStyle.playFont16)
                  ],
                ),
                AppStyle.height10,


                /// All Order Info
                CustomContainer(
                  padding: const EdgeInsets.all(AppStyle.padding10),
                    height: Get.height*0.33,
                    width: Get.width,
                  color: Colors.yellow.withOpacity(0.2),
                  widget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ServiceWidgets(
                            title: 'To Pay',
                            icon: AppIcon.toPay,
                            onPressed: (){
                              debugPrint('To Pay');
                            },
                          ),
                          ServiceWidgets(
                            title: 'To Ship',
                            icon: AppIcon.toShip,
                            onPressed: (){
                              debugPrint('To Ship');
                            },
                          ),
                          ServiceWidgets(
                            title: 'To Receive',
                            icon: AppIcon.toReceive,
                            onPressed: (){
                              debugPrint('To Received');
                            },
                          ),
                        ],
                      ),
                      AppStyle.height40,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ServiceWidgets(
                            title: 'To Review',
                            icon: AppIcon.toReview,
                            onPressed: (){
                              debugPrint('To Review');
                            },
                          ),
                          ServiceWidgets(
                            title: 'Returns',
                            icon: AppIcon.returnProduct,
                            onPressed: (){
                              debugPrint('Returns');
                            },
                          ),
                          ServiceWidgets(
                            title: 'Cancellations',
                            icon: AppIcon.cancel,
                            onPressed: (){
                              debugPrint('Cancellations');
                            },
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
                AppStyle.height20,

                Text("Services",style: AppStyle.playFont16Bold),
                AppStyle.height10,

                /// Services
                CustomContainer(
                  padding: const EdgeInsets.all(AppStyle.padding10),
                    height: Get.height*0.33,
                    width: Get.width,
                  color: Colors.blue.withOpacity(0.2),
                  widget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ServiceWidgets(
                            title: 'Messages',
                            icon: AppIcon.message,
                            onPressed: (){
                              debugPrint('Messages');
                            },
                          ),
                          ServiceWidgets(
                            title: 'Payment Option',
                            icon: AppIcon.paymentOption,
                            onPressed: (){
                              debugPrint('Payment Option');
                            },
                          ),
                          ServiceWidgets(
                            title: 'Help Center',
                            icon: AppIcon.helpCenter,
                            onPressed: (){
                              debugPrint('Help Center');
                            },
                          ),
                        ],
                      ),
                      AppStyle.height30,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ServiceWidgets(
                            title: 'My Reviews',
                            icon: AppIcon.myReview,
                            onPressed: (){
                              debugPrint('My Reviews');
                            },
                          ),
                          ServiceWidgets(
                            title: 'Chat With Us',
                            icon: AppIcon.chatWithUs,
                            onPressed: (){
                              debugPrint('Chat With Us');
                            },
                          ),
                          SizedBox(width: Get.width*0.2,)

                        ],
                      ),
                    ],
                  ),
                ),
                AppStyle.height40,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ServiceWidgets extends StatelessWidget {
  const ServiceWidgets({
    super.key,
    this.onPressed,
    this.title,
    this.icon
  });

  final VoidCallback? onPressed;
  final String? icon,title;



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(AppStyle.padding5),
        height: Get.height*0.13,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(AppStyle.radius10),
              child: Image.asset('$icon',
                height: Get.height*0.07,
                width: Get.width*0.15,
                fit: BoxFit.fill,),
            ),
            AppStyle.height10,
            Text('$title',style: AppStyle.playFontBold,),
          ],
        ),
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    this.onPressed,
    required this.height,
    required this.width,
    this.color,
    this.widget,
    this.padding,
  });

  final double height,width;
  final Color? color;
  final Widget? widget;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        padding: padding,
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color
        ),
          child: widget,
      ),
    );
  }
}
