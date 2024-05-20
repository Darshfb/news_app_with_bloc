class ApiConstants {
  String url =
      "https://newsapi.org/v2/top-headlines?country=de&category=business&apiKey=c6863f9ec5e14cc399ce5d61ea3257fa";
  static String baseUrl = "https://newsapi.org/v2/";
  static String headlineEndPoint = "top-headlines";

  static Map<String, dynamic> query({String? category})=> {
    "country": "us",
    "category": category ?? "sports",
    "apiKey": "c6863f9ec5e14cc399ce5d61ea3257fa"
  };
}
