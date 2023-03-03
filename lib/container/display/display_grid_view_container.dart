import 'package:flutter/material.dart';

import '/presentation/widgets/display/display_grid_view_widget.dart';

class DisplayGridViewContainer extends StatefulWidget {
  final int rowCount;
  final int columnCount;
  final List<String> showData;
  const DisplayGridViewContainer({
    super.key,
    required this.columnCount,
    required this.rowCount,
    required this.showData,
  });

  @override
  State<DisplayGridViewContainer> createState() =>
      _DisplayGridViewContainerState();
}

class _DisplayGridViewContainerState extends State<DisplayGridViewContainer> {
  TextEditingController searchController = TextEditingController();
  List<Map<String, dynamic>> showAlphabets = [];

  @override
  void initState() {
    super.initState();
    convertList();
  }

  void convertList() {
    showAlphabets.clear();
    for (var details in widget.showData) {
      showAlphabets.add(
        {
          'text': details,
          'searched': false,
        },
      );
    }
    setState(() {});
  }

  void tapOnReset() {
    Navigator.pop(context);
  }

  onSearch(String text) async {
    if (text.isNotEmpty) {
      for (int i = 0; i < showAlphabets.length; i++) {
        final map = showAlphabets[i];

        if (text.toLowerCase().contains(map['text'].toString().toLowerCase())) {
          map['searched'] = true;
        } else {
          map['searched'] = false;
        }
      }
    } else {
      convertList();
    }

    setState(() {});
  }

  tapOnSearchClear() {
    FocusScope.of(context).requestFocus(
      FocusNode(),
    );
    searchController.clear();
    convertList();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: DisplayGridView(
            columnCount: widget.columnCount,
            rowCount: widget.rowCount,
            showData: showAlphabets,
            tapOnReset: tapOnReset,
            onSearch: onSearch,
            searchController: searchController,
            tapOnSearchClear: tapOnSearchClear,
          ),
        ),
      ),
    );
  }
}
