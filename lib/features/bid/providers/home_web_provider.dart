import 'package:cem/features/bid/repository/bid_repository.dart';
import 'package:flutter/material.dart';

class HomeWebProvider extends ChangeNotifier {
  final BidRepository homeWebRepository;

  HomeWebProvider(this.homeWebRepository);
}
