import 'dart:convert';

/// Root model (because the JSON starts with "event": [ ... ])
class EventResponse {
  final List<Event> events;

  EventResponse({required this.events});

  factory EventResponse.fromJson(Map<String, dynamic> json) {
    return EventResponse(
      events: (json['event'] as List)
          .map((e) => Event.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'event': events.map((e) => e.toJson()).toList(),
  };

  /// Helper for decoding from raw JSON string
  static EventResponse fromRawJson(String str) =>
      EventResponse.fromJson(json.decode(str));

  /// Helper for encoding to raw JSON string
  String toRawJson() => json.encode(toJson());
}

/// Each individual event
class Event {
  final String idEvent;
  final String? idAPIfootball;
  final String? strEvent;
  final String? strEventAlternate;
  final String? strFilename;
  final String? strSport;
  final String? idLeague;
  final String? strLeague;
  final String? strLeagueBadge;
  final String? strSeason;
  final String? strDescriptionEN;
  final String? strHomeTeam;
  final String? strAwayTeam;
  final String? intHomeScore;
  final String? intAwayScore;
  final String? intRound;
  final String? strTimestamp;
  final String? dateEvent;
  final String? strTime;
  final String? idHomeTeam;
  final String? idAwayTeam;
  final String? strHomeTeamBadge;
  final String? strAwayTeamBadge;
  final String? strVenue;
  final String? strCountry;
  final String? strPoster;
  final String? strSquare;
  final String? strThumb;
  final String? strBanner;
  final String? strStatus;
  final String? strPostponed;

  Event({
    required this.idEvent,
    this.idAPIfootball,
    this.strEvent,
    this.strEventAlternate,
    this.strFilename,
    this.strSport,
    this.idLeague,
    this.strLeague,
    this.strLeagueBadge,
    this.strSeason,
    this.strDescriptionEN,
    this.strHomeTeam,
    this.strAwayTeam,
    this.intHomeScore,
    this.intAwayScore,
    this.intRound,
    this.strTimestamp,
    this.dateEvent,
    this.strTime,
    this.idHomeTeam,
    this.idAwayTeam,
    this.strHomeTeamBadge,
    this.strAwayTeamBadge,
    this.strVenue,
    this.strCountry,
    this.strPoster,
    this.strSquare,
    this.strThumb,
    this.strBanner,
    this.strStatus,
    this.strPostponed,
  });

  factory Event.fromJson(Map<String, dynamic> json) => Event(
    idEvent: json['idEvent'] ?? '',
    idAPIfootball: json['idAPIfootball'],
    strEvent: json['strEvent'],
    strEventAlternate: json['strEventAlternate'],
    strFilename: json['strFilename'],
    strSport: json['strSport'],
    idLeague: json['idLeague'],
    strLeague: json['strLeague'],
    strLeagueBadge: json['strLeagueBadge'],
    strSeason: json['strSeason'],
    strDescriptionEN: json['strDescriptionEN'],
    strHomeTeam: json['strHomeTeam'],
    strAwayTeam: json['strAwayTeam'],
    intHomeScore: json['intHomeScore']?.toString(),
    intAwayScore: json['intAwayScore']?.toString(),
    intRound: json['intRound']?.toString(),
    strTimestamp: json['strTimestamp'],
    dateEvent: json['dateEvent'],
    strTime: json['strTime'],
    idHomeTeam: json['idHomeTeam'],
    idAwayTeam: json['idAwayTeam'],
    strHomeTeamBadge: json['strHomeTeamBadge'],
    strAwayTeamBadge: json['strAwayTeamBadge'],
    strVenue: json['strVenue'],
    strCountry: json['strCountry'],
    strPoster: json['strPoster'],
    strSquare: json['strSquare'],
    strThumb: json['strThumb'],
    strBanner: json['strBanner'],
    strStatus: json['strStatus'],
    strPostponed: json['strPostponed'],
  );

  Map<String, dynamic> toJson() => {
    'idEvent': idEvent,
    'idAPIfootball': idAPIfootball,
    'strEvent': strEvent,
    'strEventAlternate': strEventAlternate,
    'strFilename': strFilename,
    'strSport': strSport,
    'idLeague': idLeague,
    'strLeague': strLeague,
    'strLeagueBadge': strLeagueBadge,
    'strSeason': strSeason,
    'strDescriptionEN': strDescriptionEN,
    'strHomeTeam': strHomeTeam,
    'strAwayTeam': strAwayTeam,
    'intHomeScore': intHomeScore,
    'intAwayScore': intAwayScore,
    'intRound': intRound,
    'strTimestamp': strTimestamp,
    'dateEvent': dateEvent,
    'strTime': strTime,
    'idHomeTeam': idHomeTeam,
    'idAwayTeam': idAwayTeam,
    'strHomeTeamBadge': strHomeTeamBadge,
    'strAwayTeamBadge': strAwayTeamBadge,
    'strVenue': strVenue,
    'strCountry': strCountry,
    'strPoster': strPoster,
    'strSquare': strSquare,
    'strThumb': strThumb,
    'strBanner': strBanner,
    'strStatus': strStatus,
    'strPostponed': strPostponed,
  };
}
