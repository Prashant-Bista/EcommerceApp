import 'package:ecommerce_app/pages/user_page/use_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../services/http_service/dio_service.dart';

class UserListController extends StateNotifier<UserListModel>{
  List<UserModel>? allUsers=[];
  UserListController({UserListModel? state}):super(state??UserListModel.initial());

  Future<void> _fetchUsers() async {
    allUsers = await dioService.fetchUser();
    state = state.copyWith(listOfUsers: allUsers);
  }
}