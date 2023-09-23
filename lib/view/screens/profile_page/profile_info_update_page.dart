import 'package:ecommerce_app/view/screens/profile_page/profile_info_page.dart';
import 'package:flutter/material.dart';

class ProfileInfoUpdatePage extends StatefulWidget {
  const ProfileInfoUpdatePage({super.key});

  @override
  State<ProfileInfoUpdatePage> createState() => _ProfileInfoUpdatePageState();
}

class _ProfileInfoUpdatePageState extends State<ProfileInfoUpdatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update your info"),
        centerTitle: true,
      ),
      body: const ProfileInfoPage(),
    );
  }
}
