import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'api/countrydeaitl/countrydeatilSreeen.dart';
import 'countrydata.dart';

class CountryScreen extends StatefulWidget {
  @override
  _CountryScreenState createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";

  @override
  void initState() {
    super.initState();
    // Fetch countries when screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CountryProvider>(context, listen: false).fetchCountries();
    });

    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Countries'),
        centerTitle: true,
      ),
      body: Consumer<CountryProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (provider.errorMessage != null) {
            return Center(child: Text(provider.errorMessage!));
          }

          // Filter countries by search query
          final filteredCountries = provider.countries
              .where((country) => country.nameEn!
              .toLowerCase()
              .contains(_searchQuery.toLowerCase()))
              .toList();

          if (filteredCountries.isEmpty) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: _buildSearchBar(),
                ),
                Expanded(
                  child: Center(child: Text('No countries found')),
                ),
              ],
            );
          }

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: _buildSearchBar(),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // number of columns
                    childAspectRatio: 3 / 2, // width / height ratio
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  padding: EdgeInsets.all(10),
                  itemCount: filteredCountries.length,
                  itemBuilder: (context, index) {
                    final country = filteredCountries[index];
                    final query = country.nameEn.toString();
                    final flag = country.flagUrl32.toString();
                    return InkWell(
                      onTap: () {
                        _searchController.clear();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => countrydetailScreen(
                              Query: query,
                              flag: flag,
                            ),
                          ),
                        );
                      },
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            country.flagUrl32 != null
                                ? Image.network(
                              country.flagUrl32!,
                              height: 50,
                              width: 100,
                              fit: BoxFit.cover,
                            )
                                : Icon(Icons.flag, size: 50),
                            SizedBox(height: 10),
                            Text(
                              country.nameEn ?? 'Unknown',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  // Beautiful Search Bar
  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: "Search countries...",
          prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 15),
          suffixIcon: _searchQuery.isNotEmpty
              ? IconButton(
            icon: Icon(Icons.clear, color: Colors.grey[600]),
            onPressed: () {
              _searchController.clear();
            },
          )
              : null,
        ),
      ),
    );
  }
}
