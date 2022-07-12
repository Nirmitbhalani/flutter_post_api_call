import 'package:http/http.dart' as http;

import 'model.dart';

class SetupProfileNetwork {
  String url = 'http://104.248.146.26:3000/api/tutor/setupTutorProfile';
  var tocken =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYxYjZmNTBiMTdkYTZjYzRlOWQ2MjI1MSIsImVtYWlsIjoiamVubnl0dXRvckBnbWFpbC5jb20iLCJpYXQiOjE2NDAzMjkwMzgsImV4cCI6MzI4NTg0MjA3Nn0.9dnrmkwWccbU5N3YGciIOkRnuzTFCJ_DLiM-t55SmII';
  Future<SetupProfile?> setup(
      String firstname, String lastname, String degree, String gender) async {
    try {
      var response = await http.post(Uri.parse(url), headers: {
        'Arthorization': 'Bearer' + tocken
      }, body: {
        'firstName': firstname,
        'lastName': lastname,
        'degree': degree,
        'gender': gender
      });
      if (response.statusCode == 200) {
        SetupProfile setupprofile = setupProfileFromJson(response.body);
        // print(setupprofile.message);
        return setupprofile;
      } else {
        throw Exception('Error');
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
