import 'package:cem/features/bid/models/bid_invitation.dart';
import 'package:cem/features/bid/repository/bid_repository.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PublishBidProvider extends ChangeNotifier {
  final BidRepository bidRepository;

  PublishBidProvider(this.bidRepository);

  bool _isLoading = false;
  String? _message;

  /// Getters
  bool get isLoading => _isLoading;
  String? get message => _message;

  /// Create Bid Method
  Future<void> createBid(BidInvitation bidInvitation) async {
    _isLoading = true;
    _message = null;
    notifyListeners();

    try {
      await bidRepository.createBid(bidInvitation);
      _isLoading = false;
      notifyListeners();
      _message = "Bid created successfully";
    } catch (e) {
      _isLoading = false;
      _message = "Bid creation failed: $e";
      debugPrint(_message);
      notifyListeners();
    }

    if (_message != null) {
      Fluttertoast.showToast(msg: _message!);
    }
  }
}
