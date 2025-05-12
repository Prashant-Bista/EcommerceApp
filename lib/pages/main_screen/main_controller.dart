import 'package:ecommerce_app/pages/main_screen/main_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainController extends StateNotifier<MainPageModel>{
  MainController({MainPageModel? state}):super(state??MainPageModel.initial());
  setCurrentIndex(int indexToSet){
    state  = state.copyWith(index: indexToSet);
  }
}