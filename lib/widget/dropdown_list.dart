// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class MultiSelectTrack extends StatefulWidget {
  final String label;
  final List<String> options;
  final List<String> selectedOptions;

  MultiSelectTrack({
    required this.label,
    required this.options,
    required this.selectedOptions,
  });

  @override
  _MultiSelectTrackState createState() => _MultiSelectTrackState();
}

class _MultiSelectTrackState extends State<MultiSelectTrack> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
        SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(2, 4),
              ),
            ],
          ),
          child: ListTile(
            title: Text(
              widget.selectedOptions.isEmpty
                  ? ' '
                  : widget.selectedOptions.join(', '),
              style: TextStyle(color: Colors.black),
            ),
            trailing: Icon(
              Icons.arrow_drop_down_circle_outlined,
              color: const Color.fromARGB(255, 15, 171, 125),
            ),
            onTap: () async {
              final List<String>? selected = await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return _MultiSelectDialog(
                    options: widget.options,
                    selectedOptions: widget.selectedOptions,
                  );
                },
              );
              if (selected != null) {
                setState(() {
                  widget.selectedOptions.clear();
                  widget.selectedOptions.addAll(selected);
                });
              }
            },
          ),
        ),
      ],
    );
  }
}

class _MultiSelectDialog extends StatefulWidget {
  final List<String> options;
  final List<String> selectedOptions;

  _MultiSelectDialog({
    required this.options,
    required this.selectedOptions,
  });

  @override
  _MultiSelectDialogState createState() => _MultiSelectDialogState();
}

class _MultiSelectDialogState extends State<_MultiSelectDialog> {
  final List<String> _tempSelectedOptions = [];

  @override
  void initState() {
    super.initState();
    _tempSelectedOptions.addAll(widget.selectedOptions);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey.shade200,
      title: Text('Tracks'),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.options.map((option) {
            return CheckboxListTile(
              value: _tempSelectedOptions.contains(option),
              title: Text(option),
              onChanged: (bool? isChecked) {
                setState(() {
                  if (isChecked!) {
                    _tempSelectedOptions.add(option);
                  } else {
                    _tempSelectedOptions.remove(option);
                  }
                });
              },
            );
          }).toList(),
        ),
      ),
      actions: [
        TextButton(
          child: Text(
            'Cancel',
            style: TextStyle(
              color: const Color.fromARGB(255, 15, 171, 125),
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        ElevatedButton(
          child: Text(
            'OK',
            style: TextStyle(
              color: const Color.fromARGB(255, 15, 171, 125),
            ),
          ),
          onPressed: () {
            Navigator.pop(context, _tempSelectedOptions);
          },
        ),
      ],
    );
  }
}
