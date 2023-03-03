import 'dart:math';

import 'package:flutter/material.dart';

import '/presentation/screens/display/display_grid_view.dart';
import '/presentation/widgets/create/create_grid_view_widget.dart';

class CreateGridViewContainer extends StatefulWidget {
  const CreateGridViewContainer({super.key});

  @override
  State<CreateGridViewContainer> createState() =>
      _CreateGridViewContainerState();
}

class _CreateGridViewContainerState extends State<CreateGridViewContainer> {
  TextEditingController row = TextEditingController();
  TextEditingController column = TextEditingController();
  int rowCount = 2;
  int columnCount = 2;
  var list = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z"
  ];
  List<String> showData = [];

  void tapOnAdd() {
    rowCount = int.parse(row.text);
    columnCount = int.parse(column.text);
    for (int i = 0; i < rowCount * columnCount; i++) {
      var element = getRandomElement(list);
      showData.add(element);
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DisplayGridView(
          rowCount: rowCount,
          columnCount: columnCount,
          showData: showData,
        ),
      ),
    ).then(
      (value) {
        FocusScope.of(context).requestFocus(
          FocusNode(),
        );
        dispose();
      },
    );
  }

  T getRandomElement<T>(List<T> list) {
    final random = Random();
    var i = random.nextInt(list.length);
    return list[i];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CreateGridViewWidget(
          column: column,
          row: row,
          tapOnAdd: tapOnAdd,
        ),
      ),
    );
  }

  @override
  void dispose() {
    row.clear();
    column.clear();
    showData.clear();
    super.dispose();
  }
}
