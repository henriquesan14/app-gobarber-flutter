import 'package:app_gobarber/pages/dashboard/prestadores/prestador_page.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'dashboard_store.g.dart';

class DashBoardStore = _DashBoardStoreBase with _$DashBoardStore;

abstract class _DashBoardStoreBase with Store {

  @observable
  int currentPage = 0;
  
  PageController pageController = PageController();

  @action
  void setPage(context, index){
    if(index == 1){
      Navigator.push(context, MaterialPageRoute(builder: (context) => PrestadorPage()));
      return;
    }
    currentPage = index;
    pageController.jumpToPage(index);
  }
  
}