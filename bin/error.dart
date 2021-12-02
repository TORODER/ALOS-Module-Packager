class ALOSMPERROR extends Error {
  String message;

  ALOSMPERROR(this.message);
  @override
  String toString() {
    return "$message \n${stackTrace.toString()}";
  }
}
