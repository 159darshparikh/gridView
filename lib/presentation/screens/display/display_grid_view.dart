import 'package:flutter/material.dart';

import '/container/display/display_grid_view_container.dart';

class DisplayGridView extends StatelessWidget {
  final int rowCount;
  final int columnCount;
  final List<String> showData;
  const DisplayGridView({
    super.key,
    required this.columnCount,
    required this.rowCount,
    required this.showData,
  });

  @override
  Widget build(BuildContext context) {
    return DisplayGridViewContainer(
      columnCount: columnCount,
      rowCount: rowCount,
      showData: showData,
    );
  }
}
