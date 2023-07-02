// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:pokemon_app/infrastructure/types/json.dart';

class Paginated<T> {
  final T data;
  final int totalData;
  final int current;

  Paginated({
    required this.data,
    required this.totalData,
    required this.current,
  });

  factory Paginated.resultMapper(JSON json, T data, int currentPage) {

    return Paginated(
      data: data,
      totalData: json['count'],
      current: currentPage,
    );
  }
}
