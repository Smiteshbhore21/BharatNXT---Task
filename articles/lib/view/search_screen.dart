import 'dart:developer';

import 'package:articles/controller/all_data.dart';

import 'package:articles/view/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchTextEditingController = TextEditingController();

  Map foundData = {};

  int indx = -1;

  @override
  Widget build(BuildContext context) {
    log("In Build");
    return Scaffold(
      backgroundColor: const Color.fromRGBO(16, 96, 72, 1),
      appBar: AppBar(
        title: Text(
          "Search Article",
          style: GoogleFonts.poppins(
            fontSize: MediaQuery.of(context).size.width * 0.066964285,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          TextField(
            controller: searchTextEditingController,
            decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    24,
                  ),
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    24,
                  ),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    24,
                  ),
                ),
              ),
              hintText: "Search Title or ID",
              fillColor: Colors.white,
              filled: true,
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: (inp) {
              search(inp.trim().toLowerCase(), context);
            },
            onSubmitted: (inp) {
              search(inp.trim().toLowerCase(), context);
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: foundData.isNotEmpty
                  ? Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                  indx: indx,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height:
                                MediaQuery.of(context).size.width * 0.133928571,
                            margin: const EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 5,
                            ),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 5,
                                ),
                                const Icon(
                                  Icons.article_rounded,
                                  color: Color.fromRGBO(16, 96, 72, 1),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Text(
                                    foundData["title"],
                                    style: GoogleFonts.poppins(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 1,
                          color: Colors.grey,
                        ),
                      ],
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }

  void search(String inp, BuildContext context) {
    foundData.clear();
    int n = Provider.of<Alldata>(context, listen: false).alldata.length;
    try {
      for (int i = 0; i < n; i++) {
        if (inp ==
                Provider.of<Alldata>(context, listen: false).alldata[i].title ||
            int.parse(inp) ==
                Provider.of<Alldata>(context, listen: false).alldata[i].id) {
          foundData = Provider.of<Alldata>(context, listen: false)
              .alldata[i]
              .articleToMap();
          indx = i;
          break;
        }
      }
    } catch (e) {
      log("$inp is not a number");
    }
    setState(() {});
  }
}
