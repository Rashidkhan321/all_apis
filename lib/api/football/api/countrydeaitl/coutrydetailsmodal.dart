class CountryDetailModel {
  List<Team>? teams;

  CountryDetailModel({this.teams});

  factory CountryDetailModel.fromJson(Map<String, dynamic> json) {
    return CountryDetailModel(
      teams: json['teams'] != null
          ? List<Team>.from(json['teams'].map((x) => Team.fromJson(x)))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'teams': teams?.map((x) => x.toJson()).toList(),
    };
  }
}

class Team {
  String? idTeam;
  String? idESPN;
  String? idAPIfootball;
  String? intLoved;
  String? strTeam;
  String? strTeamAlternate;
  String? strTeamShort;
  String? intFormedYear;
  String? strSport;
  String? strLeague;
  String? idLeague;
  String? strLeague2;
  String? idLeague2;
  String? strLeague3;
  String? idLeague3;
  String? strLeague4;
  String? idLeague4;
  String? strLeague5;
  String? idLeague5;
  String? strLeague6;
  String? idLeague6;
  String? strLeague7;
  String? idLeague7;
  String? strDivision;
  String? idVenue;
  String? strStadium;
  String? strKeywords;
  String? strRSS;
  String? strLocation;
  String? intStadiumCapacity;
  String? strWebsite;
  String? strFacebook;
  String? strTwitter;
  String? strInstagram;
  String? strDescriptionEN;
  String? strDescriptionDE;
  String? strDescriptionFR;
  String? strDescriptionCN;
  String? strDescriptionIT;
  String? strDescriptionJP;
  String? strDescriptionRU;
  String? strDescriptionES;
  String? strDescriptionPT;
  String? strDescriptionSE;
  String? strDescriptionNL;
  String? strDescriptionHU;
  String? strDescriptionNO;
  String? strDescriptionIL;
  String? strDescriptionPL;
  String? strColour1;
  String? strColour2;
  String? strColour3;
  String? strGender;
  String? strCountry;
  String? strBadge;
  String? strLogo;
  String? strFanart1;
  String? strFanart2;
  String? strFanart3;
  String? strFanart4;
  String? strBanner;
  String? strEquipment;
  String? strYoutube;
  String? strLocked;

  Team({
    this.idTeam,
    this.idESPN,
    this.idAPIfootball,
    this.intLoved,
    this.strTeam,
    this.strTeamAlternate,
    this.strTeamShort,
    this.intFormedYear,
    this.strSport,
    this.strLeague,
    this.idLeague,
    this.strLeague2,
    this.idLeague2,
    this.strLeague3,
    this.idLeague3,
    this.strLeague4,
    this.idLeague4,
    this.strLeague5,
    this.idLeague5,
    this.strLeague6,
    this.idLeague6,
    this.strLeague7,
    this.idLeague7,
    this.strDivision,
    this.idVenue,
    this.strStadium,
    this.strKeywords,
    this.strRSS,
    this.strLocation,
    this.intStadiumCapacity,
    this.strWebsite,
    this.strFacebook,
    this.strTwitter,
    this.strInstagram,
    this.strDescriptionEN,
    this.strDescriptionDE,
    this.strDescriptionFR,
    this.strDescriptionCN,
    this.strDescriptionIT,
    this.strDescriptionJP,
    this.strDescriptionRU,
    this.strDescriptionES,
    this.strDescriptionPT,
    this.strDescriptionSE,
    this.strDescriptionNL,
    this.strDescriptionHU,
    this.strDescriptionNO,
    this.strDescriptionIL,
    this.strDescriptionPL,
    this.strColour1,
    this.strColour2,
    this.strColour3,
    this.strGender,
    this.strCountry,
    this.strBadge,
    this.strLogo,
    this.strFanart1,
    this.strFanart2,
    this.strFanart3,
    this.strFanart4,
    this.strBanner,
    this.strEquipment,
    this.strYoutube,
    this.strLocked,
  });

  factory Team.fromJson(Map<String, dynamic> json) => Team(
    idTeam: json['idTeam'],
    idESPN: json['idESPN'],
    idAPIfootball: json['idAPIfootball'],
    intLoved: json['intLoved'],
    strTeam: json['strTeam'],
    strTeamAlternate: json['strTeamAlternate'],
    strTeamShort: json['strTeamShort'],
    intFormedYear: json['intFormedYear'],
    strSport: json['strSport'],
    strLeague: json['strLeague'],
    idLeague: json['idLeague'],
    strLeague2: json['strLeague2'],
    idLeague2: json['idLeague2'],
    strLeague3: json['strLeague3'],
    idLeague3: json['idLeague3'],
    strLeague4: json['strLeague4'],
    idLeague4: json['idLeague4'],
    strLeague5: json['strLeague5'],
    idLeague5: json['idLeague5'],
    strLeague6: json['strLeague6'],
    idLeague6: json['idLeague6'],
    strLeague7: json['strLeague7'],
    idLeague7: json['idLeague7'],
    strDivision: json['strDivision'],
    idVenue: json['idVenue'],
    strStadium: json['strStadium'],
    strKeywords: json['strKeywords'],
    strRSS: json['strRSS'],
    strLocation: json['strLocation'],
    intStadiumCapacity: json['intStadiumCapacity'],
    strWebsite: json['strWebsite'],
    strFacebook: json['strFacebook'],
    strTwitter: json['strTwitter'],
    strInstagram: json['strInstagram'],
    strDescriptionEN: json['strDescriptionEN'],
    strDescriptionDE: json['strDescriptionDE'],
    strDescriptionFR: json['strDescriptionFR'],
    strDescriptionCN: json['strDescriptionCN'],
    strDescriptionIT: json['strDescriptionIT'],
    strDescriptionJP: json['strDescriptionJP'],
    strDescriptionRU: json['strDescriptionRU'],
    strDescriptionES: json['strDescriptionES'],
    strDescriptionPT: json['strDescriptionPT'],
    strDescriptionSE: json['strDescriptionSE'],
    strDescriptionNL: json['strDescriptionNL'],
    strDescriptionHU: json['strDescriptionHU'],
    strDescriptionNO: json['strDescriptionNO'],
    strDescriptionIL: json['strDescriptionIL'],
    strDescriptionPL: json['strDescriptionPL'],
    strColour1: json['strColour1'],
    strColour2: json['strColour2'],
    strColour3: json['strColour3'],
    strGender: json['strGender'],
    strCountry: json['strCountry'],
    strBadge: json['strBadge'],
    strLogo: json['strLogo'],
    strFanart1: json['strFanart1'],
    strFanart2: json['strFanart2'],
    strFanart3: json['strFanart3'],
    strFanart4: json['strFanart4'],
    strBanner: json['strBanner'],
    strEquipment: json['strEquipment'],
    strYoutube: json['strYoutube'],
    strLocked: json['strLocked'],
  );

  Map<String, dynamic> toJson() => {
    'idTeam': idTeam,
    'idESPN': idESPN,
    'idAPIfootball': idAPIfootball,
    'intLoved': intLoved,
    'strTeam': strTeam,
    'strTeamAlternate': strTeamAlternate,
    'strTeamShort': strTeamShort,
    'intFormedYear': intFormedYear,
    'strSport': strSport,
    'strLeague': strLeague,
    'idLeague': idLeague,
    'strLeague2': strLeague2,
    'idLeague2': idLeague2,
    'strLeague3': strLeague3,
    'idLeague3': idLeague3,
    'strLeague4': strLeague4,
    'idLeague4': idLeague4,
    'strLeague5': strLeague5,
    'idLeague5': idLeague5,
    'strLeague6': strLeague6,
    'idLeague6': idLeague6,
    'strLeague7': strLeague7,
    'idLeague7': idLeague7,
    'strDivision': strDivision,
    'idVenue': idVenue,
    'strStadium': strStadium,
    'strKeywords': strKeywords,
    'strRSS': strRSS,
    'strLocation': strLocation,
    'intStadiumCapacity': intStadiumCapacity,
    'strWebsite': strWebsite,
    'strFacebook': strFacebook,
    'strTwitter': strTwitter,
    'strInstagram': strInstagram,
    'strDescriptionEN': strDescriptionEN,
    'strDescriptionDE': strDescriptionDE,
    'strDescriptionFR': strDescriptionFR,
    'strDescriptionCN': strDescriptionCN,
    'strDescriptionIT': strDescriptionIT,
    'strDescriptionJP': strDescriptionJP,
    'strDescriptionRU': strDescriptionRU,
    'strDescriptionES': strDescriptionES,
    'strDescriptionPT': strDescriptionPT,
    'strDescriptionSE': strDescriptionSE,
    'strDescriptionNL': strDescriptionNL,
    'strDescriptionHU': strDescriptionHU,
    'strDescriptionNO': strDescriptionNO,
    'strDescriptionIL': strDescriptionIL,
    'strDescriptionPL': strDescriptionPL,
    'strColour1': strColour1,
    'strColour2': strColour2,
    'strColour3': strColour3,
    'strGender': strGender,
    'strCountry': strCountry,
    'strBadge': strBadge,
    'strLogo': strLogo,
    'strFanart1': strFanart1,
    'strFanart2': strFanart2,
    'strFanart3': strFanart3,
    'strFanart4': strFanart4,
    'strBanner': strBanner,
    'strEquipment': strEquipment,
    'strYoutube': strYoutube,
    'strLocked': strLocked,
  };
}
