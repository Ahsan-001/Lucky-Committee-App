import 'dart:convert';
import 'package:lucky_committee/app/Models/commiteemodel.dart';
import 'package:http/http.dart' as http;

Future<List<CommitteeShow>> getCommitteeShows(String token) async {
  final url = 'https://perpaycommittee.com/api/committee-shows';

  final response = await http.get(
    Uri.parse(url),
    headers: {'Authorization': 'Bearer $token'},
  );

  if (response.statusCode == 200) {
    final jsonList = jsonDecode(response.body) as List<dynamic>;
    final committeeShows = jsonList
        .map((json) => CommitteeShow.fromJson(json))
        .toList(growable: false);
    return committeeShows;
  } else {
    throw Exception('Failed to fetch committee shows');
  }
}
