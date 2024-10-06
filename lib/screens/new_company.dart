// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:cmm/widget/appbar_new_company.dart';
import 'package:cmm/widget/custom_text_form.dart';
import 'package:cmm/widget/dropdown_list.dart';
import 'package:flutter/material.dart';

class NewCompany extends StatefulWidget {
  @override
  _CompanyFormPageState createState() => _CompanyFormPageState();
}

class _CompanyFormPageState extends State<NewCompany> {
  TextEditingController companyNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController branchesController = TextEditingController();

  List<String> selectedTracks = [];
  List<String> trackOptions = [
    'Mobile App',
    'Web',
    'AI',
    'Cloud',
    'Data Science',
    'Network'
  ];

  @override
  void initState() {
    super.initState();
    selectedTracks = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTasks(
        title: 'Add Company',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NewCompanyCard(
                label: 'Company Name',
                controller: companyNameController,
              ),
              SizedBox(height: 30),
              NewCompanyCard(
                label: 'Email',
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 30),
              NewCompanyCard(
                label: 'Password',
                controller: passwordController,
                obscureText: true,
              ),
              SizedBox(height: 30),
              NewCompanyCard(
                label: 'Branches',
                controller: branchesController,
              ),
              SizedBox(height: 30),
              MultiSelectTrack(
                label: 'Tracks',
                options: trackOptions,
                selectedOptions: selectedTracks,
              ),
              SizedBox(height: 40),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 6,
                    foregroundColor: Colors.white,
                    backgroundColor: Color.fromARGB(255, 15, 171, 125),
                    minimumSize: Size(300, 45.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Save',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
