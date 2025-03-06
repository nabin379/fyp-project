import 'package:cem/core/constants/api_endpoints.dart';
import 'package:cem/core/network/http_service.dart';
import 'package:cem/features/admin_web/home/models/bid_invitation.dart';
import 'package:flutter/material.dart';

class HomeWebRepository {
  final HttpService httpService;

  HomeWebRepository(this.httpService);

  /// Create bid Method
  Future<String?> createBid(BidInvitation bidInvitation) async {
    try {
      final response = await httpService.postRequest(
        ApiEndpoints.createBid,
        bidInvitation.toJson(),
      );

      return "hello";
    } catch (e) {
      debugPrint('Login failed: $e');
      return null; // Return null in case of error
    }
  }
}
