import 'package:all_apis/api/animals/animaldetails.dart';
import 'package:all_apis/api/animals/animalsapimodal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'animaldata.dart';

class AnimalsScreen extends StatefulWidget {
  const AnimalsScreen({super.key});

  @override
  State<AnimalsScreen> createState() => _AnimalsScreenState();
}

class _AnimalsScreenState extends State<AnimalsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AnimalsProvider>(context, listen: false).fetchAnimals();
    });
  }

  bool isValidImage(String? url) {
    if (url == null || url.isEmpty || url == "false") return false;
    return Uri.tryParse(url)?.isAbsolute ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Animals"), centerTitle: true),
      body: Consumer<AnimalsProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.errorMessage != null) {
            return Center(child: Text(provider.errorMessage!));
          }

          final allAnimals = provider.animalsData?.data ?? [];
          final animalsWithImages =
          allAnimals.where((animal) => isValidImage(animal.imageSrc)).toList();

          if (animalsWithImages.isEmpty) {
            return const Center(child: Text('No animals with valid images found'));
          }

          return ListView.builder(
            itemCount: animalsWithImages.length,
            itemBuilder: (context, index) {
              final animal = animalsWithImages[index];
              final commanname = animal.commonName.toString();
              final bioname = animal.binomialName.toString();
              final location = animal.location.toString();
              final lastrecord = animal.lastRecord.toString();
              final image = animal.imageSrc.toString();
              final shortdec = animal.shortDesc.toString();
              return Card(
                margin: const EdgeInsets.all(8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12)),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder:
                              (context)=>animalDetails(bioname:
                              bioname, commanname: commanname, location: location, lastRecord: lastrecord,
                                  imag: image, shortdec: shortdec)));
                        },
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            imagepick(imageurl: animal.imageSrc!, imagpet: BoxFit.fill,),

                            Container(
                              width: double.infinity,
                              color: Colors.black54,
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                animal.commonName ?? 'Name not present',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        animal.binomialName ?? '',
                        style: const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}


class imagepick extends StatelessWidget {

  final imageurl;
  final imagpet;
  double   height;
  double width;


  imagepick({Key? key,
    required this.imageurl,
    required this.imagpet,
    this.height = 300,
    this.width=900

  }) : super(key: key,

  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: Image(
        fit: imagpet,
        image: NetworkImage(imageurl),
        loadingBuilder: ( BuildContext context, Widget child, ImageChunkEvent? loading ){

          if(loading==null)
            return child;
          return Container(
            height: height,
            width: width,
            // MediaQuery.of(context).size.height *
            //    0.4,
            // width: MediaQuery.of(context).size.width *
            //   0.9,
            decoration: BoxDecoration(
                color: Colors.green.shade200
            ),
            child: Center(


            ),
          );
        },
        errorBuilder: (contex, exception, stack){
          return Container(
            decoration: BoxDecoration(
                color: Colors.green.shade200
            ),

            height:
            MediaQuery.of(context).size.height *
                0.3,
            width: MediaQuery.of(context).size.width *
                0.9,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [

                  Icon(Icons.wifi_off, color: Colors.black,
                    size: 30,),
                  Container(
                      margin: EdgeInsets.only(bottom: 13),
                      child: Text('check internet connection!'))
                ],
              ),
            ),
          );
        },

      ),
    );
  }
}