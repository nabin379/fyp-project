import 'package:cem/features/bid/models/bid_invitation.dart';
import 'package:cem/features/bid/repository/bid_repository.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PublishedBidsProvider extends ChangeNotifier {
  final BidRepository bidRepository;

  PublishedBidsProvider(this.bidRepository);

  List<BidInvitation> _bidInvitations = [];
  bool _isLoading = false;

  /// Getters
  List<BidInvitation> get bidInvitations => _bidInvitations;
  bool get isLoading => _isLoading;

  /// Login Method
  Future<void> getPublishedBids() async {
    _isLoading = true;
    notifyListeners();

    // get published bids list
    final temp = await bidRepository.getPublishedBids();

    _bidInvitations = [...temp];

    Fluttertoast.showToast(
        msg: 'Published Bids Fetched', toastLength: Toast.LENGTH_SHORT);

    _isLoading = false;
    notifyListeners();
  }
}
