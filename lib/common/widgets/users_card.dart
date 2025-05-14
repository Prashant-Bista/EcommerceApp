import 'package:ecommerce_app/pages/user_page/use_model.dart';
import 'package:flutter/material.dart';

class UsersCard extends StatelessWidget {
  UserModel user;
   UsersCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 35,
            child: Text(
              '${user.firstName![0]}${user.lastName![0]}',
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            '${user.firstName}${user.lastName}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            '${user.email}',
          ),
        ],
      ),
    );
  }
}
