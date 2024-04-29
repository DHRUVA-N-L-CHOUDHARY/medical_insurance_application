
abstract class ApiInterface {
  static const baseUrl = "u1c7ekciff-u1qvx9ba0e-connect.us1-azure.kaleido.io/gateways/u1ui1odqdr";


  Future getApi({
    String? url,
    Map<String, String>? headers,
  });

  Future postApi({
    String? url,
    Map<String, String>? headers,
    Map? data,
  });

  Future putApi({
    String? url,
    Map<String, String>? headers,
    Map? data,
  });

  Future deleteApi({
    String? url,
    Map<String, String>? headers,
    Map? data,
  });
}
