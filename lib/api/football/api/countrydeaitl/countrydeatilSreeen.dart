import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Antarctica.dart';
import 'fetchcountrydata.dart';


class countrydetailScreen extends StatefulWidget {
   final String Query, flag;
  const countrydetailScreen({super.key, required this.Query, required this.flag});

  @override
  State<countrydetailScreen> createState() => _countrydetailScreenState();
}

class _countrydetailScreenState extends State<countrydetailScreen> {

  void initState() {
    super.initState();
    // Fetch countries when screen loads
    WidgetsBinding.instance.addPostFrameCallback((_){

      {
        if(widget.Query=='Antarctica'){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Antarctica(flag: widget.flag,)));
        }
        else{
          Provider.of<fetchcountrydata>(context, listen: false).fetchCountries(widget.Query);

        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Center(child: Text(widget.Query))),
      body: Consumer<fetchcountrydata>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (provider.errorMessage != null) {
            return Center(child: Text(provider.errorMessage!));
          }

          if (provider.countries.isEmpty) {
            return Center(child: Text('No countries found'));
          }

          return ListView.builder( itemCount: provider.countries.length,
            itemBuilder: (context, index) {
              final country = provider.countries[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(

                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(''),
                      Image.network(
                        country.strBadge!=null
                            ? country.strBadge.toString():country.strLogo.toString(),
                        height: 300,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(height: 10,),
                      Text(country.strDescriptionEN.toString())
                    ],
                  ),
                ),
              );
            },);

        },
      ),
    );
  }
}

