import 'package:flutter/material.dart';

class JoinPage extends StatefulWidget {
  final String email;

  const JoinPage({
    super.key,
    required this.email
  });

  @override
  _JoinPageState createState() => _JoinPageState();
}

class _JoinPageState extends State<JoinPage> {
  String? birthDate;
  String? country;
  String? gender;


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
}
