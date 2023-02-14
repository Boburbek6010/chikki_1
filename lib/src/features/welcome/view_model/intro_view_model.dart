

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final introVM = ChangeNotifierProvider((ref) => IntroVM());

class IntroVM extends ChangeNotifier {

  PageController pageController = PageController();
  int pageIndex = 0;
  double indicatorWidth = 6;


  void moveToNextPage() {
    pageIndex == 3 ? pageIndex : pageIndex++;
    notifyListeners();
    if (pageIndex != 3) pageController.jumpToPage(pageIndex);
  }

  void changeIndex(int index) {
    pageIndex = index;
    indicatorWidth = 32;
    notifyListeners();
  }

}