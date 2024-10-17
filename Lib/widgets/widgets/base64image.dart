import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class img64 extends StatelessWidget {
  final String base64Image;

  const img64({key, required this.base64Image});

  Future<Uint8List?> compressImage(String base64Str) async {
    try {
      Uint8List imageBytes = base64.decode(base64Str);
      var result = await FlutterImageCompress.compressWithList(
        imageBytes,
        minHeight: 300,
        minWidth: 300,
        quality: 80, // Adjust the quality as needed
      );
      return result;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List?>(
      future: compressImage(base64Image),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return SizedBox(
              height: 300,
              width: 300,
              child: Image.memory(
                snapshot.data!,
                gaplessPlayback: true,
                fit: BoxFit.cover,
              ),
            );
          } else {
            return const SizedBox(
              height: 300,
              width: 300,
              child: Center(child: Text("Error in image compression")),
            );
          }
        } else {
         return SizedBox(
            height: 300,
            width: 300,
            child: Image.memory(
              snapshot.data!,
              gaplessPlayback: true,
              fit: BoxFit.cover,
            ),
          );
        }
      },
    );
  }
}
