import 'package:all_apis/api/animals/animalScreeen.dart';
import 'package:flutter/material.dart';

class animalDetails extends StatefulWidget {
  final String bioname, commanname, location,lastRecord,imag,shortdec;
  const animalDetails({super.key, required this.bioname, required this.commanname,
    required this.location, required this.lastRecord, required this.imag, required this.shortdec});

  @override
  State<animalDetails> createState() => _animalDetailsState();
}

class _animalDetailsState extends State<animalDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text(widget.commanname)),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
         SizedBox(height: 20,),

            imagepick(imageurl: widget.imag, imagpet: BoxFit.fill),
            SizedBox(height: 20,),
            Table(
              border: TableBorder.all(
                color: Colors.black,
                width: 1,
              ),
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              columnWidths: {
                0: FlexColumnWidth(2), // first column twice as wide
                1: FlexColumnWidth(1),
                2: FlexColumnWidth(1),
              },
              children: [
                TableRow(
                  decoration: BoxDecoration(color: Colors.grey[300]),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Attributes', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Values', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),

                  ],
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('binomialName'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(widget.bioname),
                    ),

                  ],
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('commonName'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(widget.commanname),
                    ),

                  ],
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('location'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(widget.location),
                    ),

                  ],
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('lastRecord'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(widget.lastRecord),
                    ),

                  ],
                ),

              ],
            ),
            SizedBox(height: 20,),
            Center(
              child: Text(widget.shortdec.toString()),
            )

          ],
        ),
      ),
    );
  }
}
