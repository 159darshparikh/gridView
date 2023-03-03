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
  void tapOnReset() {
    Navigator.pop(context);
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
            showData: widget.showData,
            tapOnReset: tapOnReset,
          ),
        ),
      ),
    );
  }
}
