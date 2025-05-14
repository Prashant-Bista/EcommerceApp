import 'package:ecommerce_app/pages/user_page/use_model.dart';
import 'package:flutter/material.dart';

import '../../common/widgets/custom_app_bar.dart';

class UserProfile extends StatelessWidget {
  UserModel user;
   UserProfile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Profile Page"),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: CircleAvatar(
                  radius: 35,
                  child: Text(
                    '${user.username![0]}',
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.w700),
                  ),
                ),
                title: Text(
                  '${user.username}',
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  '${user.email}',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w300),
                ),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.person),
                title: Text(
                  user.username!,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w400),
                ),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.phone),
                title: Text(
                  user.phone!,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w400),
                ),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.location_on),
                title: Text(
                  '${user.number}, ${user.street}, ${user.city}, ${user.zipcode}',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w400),
                ),
              ),
              const Divider()
            ],
          ),
        ),
      ),
    );
  }
}
