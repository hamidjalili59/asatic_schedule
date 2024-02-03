///
/// Either class used for functional programming handling
/// we can define Failure Type and success type and return anyone we want
///
class ReturnSaveFuncInfo<F> {
  final FuncInfoTypes _funcInfoTypesType = FuncInfoTypes.isSuccess;
  final List<String> _messages = [];
  bool _hasError = false;
  F? _value;

  /// set error when you have exception in your code
  void setError() => _hasError = true;

  ///
  bool hasError() => _hasError;

  /// get messages
  List<String> getMessages() {
    return _messages;
  }

  /// add message to save info of error flow
  void addMessage(String message) {
    if (message.isNotEmpty) {
      _messages.add(message);
    } else {
      _messages.add('Empty message');
    }
  }

  /// set private value in this method
  void setValue(F? value) {
    if (value != null) {
      _value = value;
    }
  }

  ///
  F? getValue() {
    if (!_hasError) {
      if (_funcInfoTypesType == FuncInfoTypes.isSuccess) {
        return _value;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }
}

///
/// we define Either type to view Either value Type status
///
enum FuncInfoTypes {
  ///
  /// return is left when we are failure state
  ///
  isFailure,

  ///
  /// return is right when we are success state
  ///
  isSuccess
}
