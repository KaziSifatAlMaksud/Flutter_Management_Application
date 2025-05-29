import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MultiTableTabPage extends StatefulWidget {
  const MultiTableTabPage({super.key});

  @override
  State<MultiTableTabPage> createState() => _MultiTableTabPageState();
}

class _MultiTableTabPageState extends State<MultiTableTabPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();
  String _searchText = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _searchController.addListener(() {
      setState(() {
        _searchText = _searchController.text.toLowerCase();
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: _isSearching
          ? TextField(
        controller: _searchController,
        autofocus: true,
        decoration: InputDecoration(
          hintText: 'Search...',
          border: InputBorder.none,
        ),
        style: GoogleFonts.roboto(
          fontSize: 18,
          color: Colors.black,
        ),
      )
          : Text(
        'Multi-Table Dashboard',
        style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
      ),
      actions: [
        _isSearching
            ? IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            setState(() {
              _isSearching = false;
              _searchController.clear();
            });
          },
        )
            : IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            setState(() {
              _isSearching = true;
            });
          },
        ),
      ],
      bottom: TabBar(
        controller: _tabController,
        tabs: const [
          Tab(text: 'Users'),
          Tab(text: 'Products'),
          Tab(text: 'Orders'),
          Tab(text: 'Sifat'),
        ],
        labelStyle: GoogleFonts.roboto(fontWeight: FontWeight.bold),
        unselectedLabelStyle: GoogleFonts.roboto(),
        indicatorColor: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildScrollableCardTab(
            columns: ['ID', 'Name', 'Email', 'Status'],
            rows: List.generate(20, (index) => [
              '${index + 1}',
              'User ${index + 1}',
              'user${index + 1}@example.com',
              index % 3 == 0 ? 'Active' : 'Inactive',
            ]),
          ),
          _buildScrollableCardTab(
            columns: ['ID', 'Product', 'Price', 'Stock'],
            rows: List.generate(12, (index) => [
              'P${index + 1}',
              'Product ${index + 1}',
              '\$${(index + 1) * 10}',
              '${(index + 1) * 5} pcs',
            ]),
          ),
          _buildScrollableCardTab(
            columns: ['Order ID', 'Customer', 'Amount', 'Date'],
            rows: List.generate(15, (index) => [
              'ORD-${index + 101}',
              'Customer ${index % 5 + 1}',
              '\$${(index + 1) * 25}',
              '2023-06-${index % 30 + 1}',
            ]),
          ),
          _buildScrollableCardTab(
            columns: ['ID', 'Name', 'Email', 'Status'],
            rows: List.generate(10, (index) => [
              '${index + 1}',
              'Sifat ${index + 1}',
              'sifat${index + 1}@example.com',
              index % 2 == 0 ? 'Online' : 'Offline',
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildScrollableCardTab({
    required List<String> columns,
    required List<List<String>> rows,
  }) {
    final filteredRows = _searchText.isEmpty
        ? rows
        : rows.where((row) {
      return row.any((cell) => cell.toLowerCase().contains(_searchText));
    }).toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: filteredRows.map((row) {
          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(columns.length, (i) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${columns[i]}: ",
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade800,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            row[i],
                            style: GoogleFonts.roboto(),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
