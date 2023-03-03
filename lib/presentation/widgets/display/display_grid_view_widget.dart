import 'package:flutter/material.dart';

class DisplayGridView extends StatelessWidget {
  final int rowCount;
  final int columnCount;
  final List<String> showData;
  final VoidCallback tapOnReset;
  const DisplayGridView({
    super.key,
    required this.rowCount,
    required this.columnCount,
    required this.showData,
    required this.tapOnReset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () => tapOnReset(),
                child: const Text(
                  "Reset",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            GridView.builder(
              itemCount: columnCount * rowCount,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: rowCount,
                childAspectRatio: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => Container(
                height: 500,
                color: Colors.grey[200],
                child: showData.isNotEmpty
                    ? Center(
                        child: Text(
                          showData[index],
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      )
                    : Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
