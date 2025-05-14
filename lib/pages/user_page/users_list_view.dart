
import 'package:ecommerce_app/pages/user_page/use_model.dart';
import 'package:ecommerce_app/pages/user_page/user_list_controller.dart';
import 'package:ecommerce_app/pages/user_page/user_profile.dart';
import 'package:ecommerce_app/services/http_service/dio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../common/widgets/custom_app_bar.dart';
import '../../common/widgets/users_card.dart';
import '../../common/widgets/users_solid_card.dart';

class UsersListView extends ConsumerWidget {
   UsersListView({super.key});
final UserListProvider = StateNotifierProvider<UserListController,UserListModel>((ref)=>UserListController());
late UserListModel userListData;
late UserListController userListController;
  @override
  Widget build(BuildContext context,ref) {
    userListController = ref.watch(UserListProvider.notifier);
    userListData = ref.watch(UserListProvider);
    return SizedBox(
      child: userListData.userList!.isEmpty
          ? Skeletonizer(
          enabled: userListData.userList!.isEmpty,
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8),
              itemBuilder: (context, index) {
                return const UsersSolidCard();
              }))
          : GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8),
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                },
                child: UsersCard(user: userListData.userList![index]));
          }),
    );
  }
}

