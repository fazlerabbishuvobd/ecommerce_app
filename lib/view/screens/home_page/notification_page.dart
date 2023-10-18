import 'package:flutter/material.dart';
import 'package:get/get.dart';
class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.amber,
                    ),
                    SizedBox(width: Get.width*0.02,),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Notification Title'),
                        Text('Notifications Body'),
                      ],
                    ),
                    const Spacer(),
                    IconButton(onPressed: () {

                    }, icon: const Icon(Icons.delete))
                  ],
                ),
              );
            },
        ),
      ),
    );
  }
}
