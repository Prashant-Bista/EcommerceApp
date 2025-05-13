import 'package:ecommerce_app/pages/user_page/use_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserController extends StateNotifier<UserModel>{
  UserController({required UserModel? state}):super(state??UserModel.initial());
}