/// This file contains the abstract class `DataState` and its two implementations `DataSuccess` and `DataError`.
/// `DataState` is used to represent the state of data fetching operations. It contains a generic type `T` for the data,
/// and a `DioException` object for the error.
/// `DataSuccess` is used to represent the successful state of data fetching operations, and contains the fetched data.
/// `DataError` is used to represent the failed state of data fetching operations, and contains the error object.
import 'package:dio/dio.dart';

abstract class DataState<T> {
  final T? data;
  final DioException? error;

  const DataState({this.data, this.error});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataError<T> extends DataState<T> {
  const DataError(DioException error) : super(error: error);
}
