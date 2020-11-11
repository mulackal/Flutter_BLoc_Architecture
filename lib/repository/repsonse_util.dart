class ResponseUtil<T> {
  Status status;
  T data;
  String message;

  ResponseUtil.loading(this.message) : status = Status.LOADING;
  ResponseUtil.completed(this.data) : status = Status.COMPLETED;
  ResponseUtil.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

enum Status { LOADING, COMPLETED, ERROR }
