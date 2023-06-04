import 'package:client/backend/witb-server/join.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JoinPage extends StatefulWidget {
  final String email;
  final String idToken;

  const JoinPage({
    super.key,
    required this.email,
    required this.idToken,
  });

  @override
  _JoinPageState createState() => _JoinPageState();
}

class _JoinPageState extends State<JoinPage> {
  String? nickname;
  String? birthDate;
  String? country;
  String? gender;

  SharedPreferences? _prefs;

  @override
  void initState() {
    super.initState();
    _initSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.email
            ),
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'nickname',
              ),
              onChanged: (value) {
                setState(() {
                  nickname = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Date of birth',
              ),
              onChanged: (value) {
                setState(() {
                  birthDate = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Country',
              ),
              onChanged: (value) {
                setState(() {
                  country = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Gender',
              ),
              onChanged: (value) {
                setState(() {
                  gender = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // 입력된 생년월일, 국가, 성별을 사용
                if (birthDate != null && country != null && gender != null) {
                  print('Date of Birth: ${birthDate}');
                  print('Country: $country');
                  print('Gender: $gender');

                  joinWithRequest();
                } else {
                  print('Please fill in all fields');
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  void joinWithRequest() {
    List<String> yyyymmdd = birthDate!.split("-");
    int year = int.parse(yyyymmdd[0]);
    int month = int.parse(yyyymmdd[1]);
    int day = int.parse(yyyymmdd[2]);

    var birthDateRequest = JoinBirthDateRequest(
      year: year,
      month: month,
      day: day,
    );

    var joinRequest = JoinRequest(
      idToken: widget.idToken,
      name: nickname!,
      email: widget.email,
      countryCode: country!,
      sex: gender!,
      birthDate: birthDateRequest,
      social: "GOOGLE",
    );

    join(joinRequest).then((witbToken) {
      _prefs?.setString('witbToken', witbToken);
    });
  }

  Future<void> _initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }
}
