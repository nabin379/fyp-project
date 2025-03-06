import 'package:cem/features/admin_web/home/repository/home_web_repository.dart';
import 'package:flutter/material.dart';

class HomeWebProvider extends ChangeNotifier {
  final HomeWebRepository homeWebRepository;

  HomeWebProvider(this.homeWebRepository);
}
