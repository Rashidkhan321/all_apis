class animalsmodal {
  String? status;
  int? results;
  List<Data>? data;

  animalsmodal({this.status, this.results, this.data});

  animalsmodal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    results = json['results'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['results'] = this.results;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? binomialName;
  String? commonName;
  String? location;
  String? wikiLink;
  String? lastRecord;
  String? imageSrc;
  String? shortDesc;

  Data(
      {this.binomialName,
        this.commonName,
        this.location,
        this.wikiLink,
        this.lastRecord,
        this.imageSrc,
        this.shortDesc});

  Data.fromJson(Map<String, dynamic> json) {
    binomialName = json['binomialName'];
    commonName = json['commonName'];
    location = json['location'];
    wikiLink = json['wikiLink'];
    lastRecord = json['lastRecord'];
    imageSrc = json['imageSrc'];
    shortDesc = json['shortDesc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['binomialName'] = this.binomialName;
    data['commonName'] = this.commonName;
    data['location'] = this.location;
    data['wikiLink'] = this.wikiLink;
    data['lastRecord'] = this.lastRecord;
    data['imageSrc'] = this.imageSrc;
    data['shortDesc'] = this.shortDesc;
    return data;
  }
}
