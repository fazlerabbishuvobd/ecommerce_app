import 'package:ecommerce_app/resources/routes/app_routes_name.dart';
import 'package:ecommerce_app/view/screens/add_to_cart_page/add_to_cart_page.dart';
import 'package:ecommerce_app/view/screens/add_to_cart_page/chekout_page/address_page/add_new_address_page.dart';
import 'package:ecommerce_app/view/screens/add_to_cart_page/chekout_page/address_page/address_page.dart';
import 'package:ecommerce_app/view/screens/add_to_cart_page/chekout_page/address_page/update_address_page.dart';
import 'package:ecommerce_app/view/screens/add_to_cart_page/chekout_page/checkout_page.dart';
import 'package:ecommerce_app/view/screens/add_to_cart_page/chekout_page/order_confirmation_page.dart';
import 'package:ecommerce_app/view/screens/add_to_cart_page/chekout_page/payment_page.dart';
import 'package:ecommerce_app/view/screens/bottom_navbar/bottom_navbar_page.dart';
import 'package:ecommerce_app/view/screens/favourite_product_page/favourite_product_page.dart';
import 'package:ecommerce_app/view/screens/home_page/all_category_page.dart';
import 'package:ecommerce_app/view/screens/home_page/home_page.dart';
import 'package:ecommerce_app/view/screens/home_page/product_search_page.dart';
import 'package:ecommerce_app/view/screens/product_details_page/product_details_page.dart';
import 'package:ecommerce_app/view/screens/product_details_page/product_full_image_page.dart';
import 'package:ecommerce_app/view/screens/splash_screen/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes{
  static appRoutes()=>[
    GetPage(name: AppRouteName.splashScreen, page: ()=> const SplashScreen()),
    GetPage(name: AppRouteName.bottomNavBarPage, page: ()=> const BottomNavBarPage()),
    GetPage(name: AppRouteName.homePage, page: ()=> const HomePage()),
    GetPage(name: AppRouteName.productSearchPage, page: ()=> const ProductSearchPage()),
    GetPage(name: AppRouteName.allCategoryPage, page: ()=> const AllCategoryPage()),
    GetPage(name: AppRouteName.productDetailsPage, page: ()=> const ProductDetailsPage()),
    GetPage(name: AppRouteName.allReviewPage, page: ()=> const ProductDetailsPage()),
    GetPage(name: AppRouteName.productFullImagePage, page: ()=> const ProductFullImagePage()),
    GetPage(name: AppRouteName.addToCartPage, page: ()=> const AddToCartPage()),
    GetPage(name: AppRouteName.checkoutPage, page: ()=> const CheckoutPage()),
    GetPage(name: AppRouteName.addressPage, page: ()=> const AddressSetupPage()),
    GetPage(name: AppRouteName.addNewAddressPage, page: ()=> const AddNewAddressPage()),
    GetPage(name: AppRouteName.updateAddressPage, page: ()=> const UpdateAddressPage()),
    GetPage(name: AppRouteName.paymentPage, page: ()=> const PaymentPage()),
    GetPage(name: AppRouteName.orderConfirmPage, page: ()=> const OrderConfirmationPage()),
    GetPage(name: AppRouteName.favouriteProductPage, page: ()=> const FavouriteProductPage()),
  ];
}