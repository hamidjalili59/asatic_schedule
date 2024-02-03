///
/// we use one response model data for every response
///
class BaseResponse {
  ///
  /// explain data to baseResponse
  ///
  const BaseResponse(this.statusCode, this.message, this.data);

  ///
  /// http status code like 200 400 500
  ///
  final int statusCode;

  ///
  /// we can send a message for explain exceptions and errors
  ///
  final String message;

  ///
  /// a dynamic argument for sending success data
  ///
  final dynamic data;

  ///
  /// this method make a new instance with mix old data and new data
  ///
  BaseResponse copyWith(
    int newStatusCode,
    String newMessage,
    dynamic newData,
  ) {
    return BaseResponse(newStatusCode, newMessage, newData);
  }

  ///
  ///this method help us to convert our instance to json Object
  ///
  Map<String, dynamic> toJson(BaseResponse data) {
    return {
      'data': data.data,
      'message': data.message,
      'statusCode': data.statusCode,
    };
  }
}
