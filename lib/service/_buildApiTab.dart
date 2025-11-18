import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

/// =============================
/// API SERVICE CLASS
/// =============================
class IssueService {
  static const String baseUrl = "http://127.0.0.1:8000/api";

  static Future<List<dynamic>> fetchAcknowledged() =>
      _fetchData("/getissueAcknowledged");

  static Future<List<dynamic>> fetchOngoing() =>
      _fetchData("/getissueOngoing");

  static Future<List<dynamic>> fetchRejected() =>
      _fetchData("/getissueRejected");

  static Future<List<dynamic>> _fetchData(String endpoint) async {
    final url = Uri.parse("$baseUrl$endpoint");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      return body["data"] ?? [];
    } else {
      throw Exception("API error: ${response.statusCode}");
    }
  }
}

/// =============================
///  PUBLIC FUNCTION (NOW WORKS)
/// =============================

Widget buildApiTab(
    Future<List<dynamic>> Function() fetchFunction, {
      String searchText = "",
    }) {
  return FutureBuilder<List<dynamic>>(
    future: fetchFunction(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      }
      if (snapshot.hasError) {
        return Center(child: Text("Error: ${snapshot.error}"));
      }

      final data = snapshot.data ?? [];

      final filtered = searchText.isEmpty
          ? data
          : data.where((item) {
        return item
            .toString()
            .toLowerCase()
            .contains(searchText.toLowerCase());
      }).toList();

      return ListView(
        padding: const EdgeInsets.all(12),
        children: filtered.map((item) {
          return Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14)),
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: (item as Map<String, dynamic>).entries.map((field) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        Text(
                          "${field.key}: ",
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade800,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            field.value.toString(),
                            style: GoogleFonts.roboto(),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          );
        }).toList(),
      );
    },
  );
}

/// =============================
/// PUBLIC DUMMY TAB
/// =============================
Widget buildDummyTab() {
  return const Center(
      child: Text("Dummy Tab", style: TextStyle(fontSize: 18)));
}
