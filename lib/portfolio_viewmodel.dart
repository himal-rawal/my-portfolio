import 'package:flutter/material.dart';
import 'package:myportfolio/enum.dart';

class PortfolioViewmodel with ChangeNotifier {
  PortfolioViewEnum _showPage = PortfolioViewEnum.homePage;
  PortfolioViewEnum get showPage => _showPage;
  setPortfolioPage(PortfolioViewEnum selecctedPage) {
    _showPage = selecctedPage;
    notifyListeners();
  }

  bool _hideExperienceDetail = true;
  bool get hideExperienceDetail => _hideExperienceDetail;
  setExperienceDetailVisibility() {
    _hideExperienceDetail = !_hideExperienceDetail;
    notifyListeners();
  }

  final List<bool> _subtitleVisibility = [false, false, false, false];

  List<bool> get subtitleVisibility => _subtitleVisibility;
  setAchievementDetailVisibility(int index) {
    _subtitleVisibility[index] = !_subtitleVisibility[index];

    notifyListeners();
  }
}
