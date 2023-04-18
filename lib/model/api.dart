class API {

  static const String _url = 'https://www.asdasdasd.com';

  static Future<String> getResponse(String microservice, {bool useToken = true}) async {
    try {
      void response = await Future.delayed(
        const Duration(milliseconds: 200),
      );
      return 'response';
    } catch (e) {
      rethrow;
    }
  }
}