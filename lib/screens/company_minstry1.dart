// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, use_key_in_widget_constructors

import 'package:cmm/widget/appbar_company_ministry.dart';
import 'package:cmm/widget/company_card.dart';
import 'package:flutter/material.dart';

class CompaniesPage extends StatefulWidget {
  @override
  _CompaniesPageState createState() => _CompaniesPageState();
}

class _CompaniesPageState extends State<CompaniesPage> {
  List<Map<String, String>> companies = [
    {'name': 'AST', 'details': ' '},
    {'name': 'AUC', 'details': ' '},
    {'name': 'MEA', 'details': ' '},
  ];
  void deleteCompany(int index) {
    setState(() {
      companies.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCompany(
        title: 'Companies',
      ),
      backgroundColor: Colors.green.shade50,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Companies',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(16),
                itemCount: companies.length,
                itemBuilder: (context, index) {
                  final company = companies[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 25.0),
                    child: CompanyCard(
                      companyName: company['name']!,
                      companyDetails: company['details']!,
                      onDelete: () {
                        setState(() {
                          companies.removeAt(index);
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
