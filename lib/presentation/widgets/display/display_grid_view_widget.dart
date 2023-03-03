import 'package:flutter/material.dart';

class DisplayGridView extends StatelessWidget {
  final int rowCount;
  final int columnCount;
  final List<Map<String, dynamic>> showData;
  final VoidCallback tapOnReset;
  final TextEditingController searchController;
  final Function(String text) onSearch;
  final VoidCallback tapOnSearchClear;
  const DisplayGridView({
    super.key,
    required this.rowCount,
    required this.columnCount,
    required this.showData,
    required this.tapOnReset,
    required this.searchController,
    required this.onSearch,
    required this.tapOnSearchClear,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: ListTile(
                leading: const Icon(Icons.search),
                title: TextField(
                  controller: searchController,
                  decoration: const InputDecoration(
                    hintText: 'Search text',
                    border: InputBorder.none,
                  ),
                  onChanged: onSearch,
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.cancel),
                  onPressed: () => tapOnSearchClear(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            GridView.builder(
              itemCount: showData.length,
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
                color: showData[index]['searched']
                    ? Colors.amber[200]
                    : Colors.grey[200],
                child: showData.isNotEmpty
                    ? Center(
                        child: Text(
                          showData[index]['text'],
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      )
                    : Container(),
              ),
            ),
            const SizedBox(height: 20),
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
          ],
        ),
      ),
    );
  }
}
