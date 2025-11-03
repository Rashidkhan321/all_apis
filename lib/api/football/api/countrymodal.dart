class countrymodal {
  List<Countries>? countries;

  countrymodal({this.countries});

  countrymodal.fromJson(Map<String, dynamic> json) {
    if (json['countries'] != null) {
      countries = <Countries>[];
      json['countries'].forEach((v) {
        countries!.add(new Countries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.countries != null) {
      data['countries'] = this.countries!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Countries {
  String? nameEn;
  String? flagUrl32;

  Countries({this.nameEn, this.flagUrl32});

  Countries.fromJson(Map<String, dynamic> json) {
    nameEn = json['name_en'];
    flagUrl32 = json['flag_url_32'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name_en'] = this.nameEn;
    data['flag_url_32'] = this.flagUrl32;
    return data;
  }
}
