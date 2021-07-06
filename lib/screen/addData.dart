import 'package:api3/data/model/testData.dart';
import 'package:api3/data/services/api_service.dart';
import 'package:api3/utilities/textStyle.dart';
import 'package:api3/widget/appbar.dart';
import 'package:api3/widget/elevatedButton.dart';
import 'package:flutter/material.dart';

class AddData extends StatefulWidget {
  final TestData testData;
  AddData({this.testData});
  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController _name;
  TextEditingController _email;

  @override
  void initState() {
    var text = widget.testData;
    var isEdit = widget.testData != null;
    _name = TextEditingController(text: isEdit ? text.name : "");
    _email = TextEditingController(text: isEdit ? text.email : "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appbar(
        context,
        textString: widget.testData == null ? "Add Data" : "Edit data",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.03,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            textformfield(
              keyboardType: TextInputType.name,
              hintText: "Enter your Name",
              controller: _name,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            textformfield(
              keyboardType: TextInputType.emailAddress,
              hintText: "Enter your Email",
              controller: _email,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            elevatedbutton(
              context,
              textString: widget.testData == null ? "Add Data" : "Edit Data",
              onPressed: () {
                if (widget.testData != null) {
                  final email = _email.text;
                  final name = _name.text;
                  try {
                    ApiService.updateTestData(
                      id: widget.testData.id,
                      name: name,
                      email: email,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Successfully Post Updated"),
                    ));
                    Navigator.pop(context);
                  } catch (e) {
                    print("Error Add Data" + e);
                  }
                }
                if (widget.testData == null) {
                  final email = _email.text;
                  final name = _name.text;
                  try {
                    ApiService.postTestData(
                      name: name,
                      email: email,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Successfully Post"),
                    ));
                    Navigator.pop(context);
                  } catch (e) {
                    print("Error Add Data" + e);
                  }
                }
                _name.clear();
                _email.clear();
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget textformfield({
  TextEditingController controller,
  String hintText,
  TextInputType keyboardType,
}) {
  return TextFormField(
    keyboardType: keyboardType,
    cursorColor: Colors.red,
    controller: controller,
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: textStyle(
        color: Colors.grey,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide(
          color: Colors.grey.withOpacity(0.3),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide(
          color: Colors.grey.withOpacity(0.3),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide(
          color: Colors.grey.withOpacity(0.3),
        ),
      ),
      fillColor: Colors.grey.withOpacity(0.1),
      filled: true,
    ),
  );
}
