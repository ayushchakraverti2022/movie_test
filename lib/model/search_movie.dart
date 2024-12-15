class SearchMovie {
  final int id;
  final String url;
  final String name;
  final String type;
  final String language;
  final List<String> genres;
  final String status;
  final int? runtime;
  final int? averageRuntime;
  final String? premiered;
  final String? ended;
  final String? officialSite;
  final Schedule schedule;
  final double? rating;
  final int weight;
  final Network? network;
  final String? summary;
  final ImageData image;
  final String? previousEpisodeName;
  final String? nextEpisodeName;

  SearchMovie({
    required this.id,
    required this.url,
    required this.name,
    required this.type,
    required this.language,
    required this.genres,
    required this.status,
    this.runtime,
    this.averageRuntime,
    this.premiered,
    this.ended,
    this.officialSite,
    required this.schedule,
    this.rating,
    required this.weight,
    this.network,
    this.summary,
    required this.image,
    this.previousEpisodeName,
    this.nextEpisodeName,
  });

  factory SearchMovie.fromJson(Map<String, dynamic> json) {
    final show = json['show'];
    return SearchMovie(
      id: show['id'],
      url: show['url'],
      name: show['name'],
      type: show['type'],
      language: show['language'],
      genres: List<String>.from(show['genres']),
      status: show['status'],
      runtime: show['runtime'],
      averageRuntime: show['averageRuntime'],
      premiered: show['premiered'],
      ended: show['ended'],
      officialSite: show['officialSite'],
      schedule: Schedule.fromJson(show['schedule']),
      rating: show['rating']['average']?.toDouble(),
      weight: show['weight'],
      network: show['network'] != null ? Network.fromJson(show['network']) : null,
      summary: show['summary']?.replaceAll(RegExp(r"<[^>]*>"), ""),
      image: ImageData.fromJson(show['image']),
      previousEpisodeName: show['_links']['previousepisode']?['name'],
      nextEpisodeName: show['_links']['nextepisode']?['name'],
    );
  }
}

class Schedule {
  final String time;
  final List<String> days;

  Schedule({
    required this.time,
    required this.days,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      time: json['time'],
      days: List<String>.from(json['days']),
    );
  }
}

class Network {
  final String name;
  final String country;
  final String timezone;
  final String? officialSite;

  Network({
    required this.name,
    required this.country,
    required this.timezone,
    this.officialSite,
  });

  factory Network.fromJson(Map<String, dynamic> json) {
    return Network(
      name: json['name'],
      country: json['country']['name'],
      timezone: json['country']['timezone'],
      officialSite: json['officialSite'],
    );
  }
}

class ImageData {
  final String medium;
  final String original;

  ImageData({
    required this.medium,
    required this.original,
  });

  factory ImageData.fromJson(Map<String, dynamic> json) {
    return ImageData(
      medium: json['medium'],
      original: json['original'],
    );
  }
}
