
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchZone extends StatefulWidget {
  const SearchZone({super.key});

  @override
  _SearchZoneState createState() => _SearchZoneState();
}

class _SearchZoneState extends State<SearchZone> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 75,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  maxLines: 1, 
                  cursorHeight: 20,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.grey[500]),
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    suffixIcon: _controller.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear, color: Colors.grey),
                            onPressed: () {
                              _controller.clear();
                              setState(() {});  // Refresh the UI
                            },
                          )
                        : null,
                    filled: true,
                    fillColor: Colors.white,
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(10),
                    // ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ) ,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                  ),
                  style: const TextStyle(fontSize: 20 ),
                  onChanged: (text) {
                    setState(() {});  
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

