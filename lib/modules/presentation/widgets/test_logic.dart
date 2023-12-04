String createQueryString(Map<dynamic, dynamic> input) {
  final String q = input['q'];
  final int limit = input['limit'];
  final query = [];
  input.forEach((key, value) {
    query.add('$key=$value');
  });
  
  return '?q=$q&limit=${limit}';
}
