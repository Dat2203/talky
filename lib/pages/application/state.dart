import 'package:get/get.dart';

class ApplicationState {
  final _pageIndex =0.obs;
  int get pageIndex => _pageIndex.value;
  set pageIndex(int value)=>_pageIndex.value = value;
}
