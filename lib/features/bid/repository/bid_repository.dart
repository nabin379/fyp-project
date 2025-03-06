import 'package:cem/core/constants/api_endpoints.dart';
import 'package:cem/core/network/http_service.dart';
import 'package:cem/features/bid/models/bid_invitation.dart';
import 'package:flutter/material.dart';

class BidRepository {
  final HttpService httpService;

  BidRepository(this.httpService);

  /// Create bid Method
  Future<String?> createBid(BidInvitation bidInvitation) async {
    try {
      final response = await httpService.postRequest(
        ApiEndpoints.createBid,
        bidInvitation.toJson(),
      );

      return "hello";
    } catch (e) {
      debugPrint('Bid creation failed: $e');
      return null; // Return null in case of error
    }
  }

  /// Get Publised Bids
  ///
  Future<List<BidInvitation>> getPublishedBids() async {
    try {
      final response = await httpService.getRequest(
        ApiEndpoints.publishedBid,
      ) as List;

      return response
          .map(
            (e) => BidInvitation.fromJson(e),
          )
          .toList();
    } catch (e) {
      debugPrint('Failed to get BidInvitations $e');
      return [];
    }
  }
}
