import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StudentPage extends StatefulWidget {
  @override
  _StudentPageState createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  String? _selectedSection;
  String? _selectedSem;
  String? _selectedSortColumn;
  bool _isAscending = true;
  int? _selectedSortColumnIndex;
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Information', style: TextStyle(fontSize: 22)),
        backgroundColor: Colors.deepPurple,
        elevation: 4,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: DataSearch(
                  searchQuery: _searchQuery,
                  onSearch: (query) {
                    setState(() {
                      _searchQuery = query;
                    });
                  },
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              _resetFilters();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Filters
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 5)],
                    ),
                    child: DropdownButtonFormField<String?>(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        hintText: 'Select Section',
                        isDense: true,
                      ),
                      value: _selectedSection,
                      onChanged: (value) {
                        setState(() {
                          _selectedSection = value;
                        });
                      },
                      items: ['All', 'A', 'B', 'C'].map((item) {
                        return DropdownMenuItem<String?>(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 5)],
                    ),
                    child: DropdownButtonFormField<String?>(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        hintText: 'Select Semester',
                        isDense: true,
                      ),
                      value: _selectedSem,
                      onChanged: (value) {
                        setState(() {
                          _selectedSem = value;
                        });
                      },
                      items: ['All']
                        .followedBy(List.generate(8, (index) => (index + 1).toString()))
                        .map((item) {
                          return DropdownMenuItem<String?>(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            // Sorting Controls
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: [
                _buildSortButton('Name', 'name'),
                _buildSortButton('USN', 'usn'),
                _buildSortButton('Email', 'email'),
                _buildSortButton('Section', 'sec'),
                _buildSortButton('Semester', 'sem'),
                _buildSortButton('Sports', 'sports'),
                _buildSortButton('Experienced', 'isExperienced'),
              ],
            ),
            SizedBox(height: 16),
            // Data Table
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _getFilteredAndSortedStudents(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return Center(child: Text('No records found.', style: TextStyle(fontSize: 18, color: Colors.red)));
                  }

                  final students = snapshot.data!.docs;

                  // Convert data for DataTable
                  List<DataRow> rows = students.map((doc) {
                    final student = doc.data() as Map<String, dynamic>;
                    final highlight = _searchQuery.isNotEmpty &&
                        _matchesSearchQuery(student, _searchQuery);

                    return DataRow(
                      color: highlight ? MaterialStateProperty.all(Colors.yellow[100]) : null,
                      cells: [
                        DataCell(Text(_getStringValue(student, 'name'))),
                        DataCell(Text(_getStringValue(student, 'usn'))),
                        DataCell(Text(_getStringValue(student, 'email'))),
                        DataCell(Text(_getStringValue(student, 'sec'))),
                        DataCell(Text(_getStringValue(student, 'sem'))),
                        DataCell(Text(_getListValue(student, 'sports'))),
                        DataCell(Text(_getStringValue(student, 'isExperienced'))),
                      ],
                    );
                  }).toList();

                  return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                    
                      child: DataTable(
                        sortColumnIndex: _selectedSortColumnIndex,
                        sortAscending: _isAscending,
                        columns: _buildColumns(),
                        rows: rows,
                        columnSpacing: 24,
                        headingRowColor: MaterialStateColor.resolveWith(
                          (states) => Colors.deepPurple[50]!,
                        ),
                        dataTextStyle: TextStyle(color: Colors.black87),
                        headingTextStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple),
                      ),
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

  void _resetFilters() {
    setState(() {
      _selectedSection = null;
      _selectedSem = null;
      _selectedSortColumn = null;
      _isAscending = true;
      _selectedSortColumnIndex = null;
      _searchQuery = '';
    });
  }

  Widget _buildSortButton(String title, String column) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.deepPurple, // Background color
        onPrimary: Colors.white, // Text color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: () {
        setState(() {
          _selectedSortColumn = column;
          _isAscending = !_isAscending;
          _selectedSortColumnIndex = _getColumnIndex(column);
        });
      },
      child: Text(
        '$title ${_selectedSortColumn == column ? (_isAscending ? '▲' : '▼') : ''}',
        style: TextStyle(fontSize: 14),
      ),
    );
  }

  int _getColumnIndex(String column) {
    switch (column) {
      case 'name': return 0;
      case 'usn': return 1;
      case 'email': return 2;
      case 'sec': return 3;
      case 'sem': return 4;
      case 'sports': return 5;
      case 'isExperienced': return 6;
      default: return 0;
    }
  }

  List<DataColumn> _buildColumns() {
    return [
      DataColumn(label: Text('Name')),
      DataColumn(label: Text('USN')),
      DataColumn(label: Text('Email')),
      DataColumn(label: Text('Section')),
      DataColumn(label: Text('Semester')),
      DataColumn(label: Text('Sports')),
      DataColumn(label: Text('Experienced')),
    ];
  }

  Stream<QuerySnapshot> _getFilteredAndSortedStudents() {
    Query<Map<String, dynamic>> query = FirebaseFirestore.instance.collection('registrations');

    if (_selectedSection != null && _selectedSection != 'All') {
      query = query.where('sec', isEqualTo: _selectedSection);
    }
    if (_selectedSem != null && _selectedSem != 'All') {
      query = query.where('sem', isEqualTo: _selectedSem);
    }
    if (_selectedSortColumn != null) {
      query = query.orderBy(_selectedSortColumn!, descending: !_isAscending);
    }

    return query.snapshots();
  }

  String _getStringValue(Map<String, dynamic> student, String field) {
    var value = student[field];
    if (value == null) return '';
    if (value is List) {
      return value.isNotEmpty ? value[0].toString() : '';
    }
    return value.toString();
  }

  String _getListValue(Map<String, dynamic> student, String field) {
    var value = student[field];
    if (value == null) return '';
    if (value is List) {
      return value.join(', '); // Join list elements with a comma and space
    }
    return value.toString();
  }

  bool _matchesSearchQuery(Map<String, dynamic> student, String query) {
    final lowerCaseQuery = query.toLowerCase();
    return student.values.any((value) {
      if (value is String) {
        return value.toLowerCase().contains(lowerCaseQuery);
      }
      if (value is List) {
        return value.any((element) => element.toString().toLowerCase().contains(lowerCaseQuery));
      }
      return false;
    });
  }
}

class DataSearch extends SearchDelegate<String> {
  final String searchQuery;
  final ValueChanged<String> onSearch;

  DataSearch({required this.searchQuery, required this.onSearch});

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    onSearch(query);
    Navigator.pop(context);
    return Container(); // You might want to show results here
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = query.isEmpty ? [] : [query]; // Use a simple list of suggestions for demonstration

    return ListView(
      children: suggestions.map((suggestion) {
        return ListTile(
          title: Text(suggestion),
          onTap: () {
            query = suggestion;
            buildResults(context);
          },
        );
      }).toList(),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      ),
    ];
  }
}
