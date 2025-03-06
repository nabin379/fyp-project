/// Class which contains all the endpoints of the Api Network Request
///
class ApiEndpoints {
  static const baseUrl = "http://localhost:8080";

  static const login = "/login";

  // create bid
  static const createBid = "/bid/create";

  // get published
  static const publishedBids = "/bid/categories";
}


/// Use endpoints like this ["${ApiEndpoints.baseUrl}${ApiEndpoints.login}"] for login