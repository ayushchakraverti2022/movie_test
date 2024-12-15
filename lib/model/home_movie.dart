

class HomeMovie {
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
  final Schedule? schedule;
  final double? rating;
  final int weight;
  final Network? network;
  final String? summary;
  final ImageData? image;
  final String? previousEpisodeName;
  final String? nextEpisodeName;

  HomeMovie({
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
    this.schedule,
    this.rating,
    required this.weight,
    this.network,
    this.summary,
    this.image,
    this.previousEpisodeName,
    this.nextEpisodeName,
  });

  factory HomeMovie.fromJson(Map<String, dynamic> json) {
    final show = json['show'];
    return HomeMovie(
      id: show['id'] ?? 0,
      url: show['url'] ?? '',
      name: show['name'] ?? 'Unknown',
      type: show['type'] ?? 'Unknown',
      language: show['language'] ?? 'Unknown',
      genres: List<String>.from(show['genres'] ?? []),
      status: show['status'] ?? 'Unknown',
      runtime: show['runtime'],
      averageRuntime: show['averageRuntime'],
      premiered: show['premiered'],
      ended: show['ended'],
      officialSite: show['officialSite'],
      schedule: show['schedule'] != null ? Schedule.fromJson(show['schedule']) : null,
      rating: show['rating']?['average']?.toDouble(),
      weight: show['weight'] ?? 0,
      network: show['network'] != null ? Network.fromJson(show['network']) : null,
      summary: show['summary']?.replaceAll(RegExp(r"<[^>]*>"), ""),
      image: show['image'] != null ? ImageData.fromJson(show['image']) : null,
      previousEpisodeName: show['_links']?['previousepisode']?['name'],
      nextEpisodeName: show['_links']?['nextepisode']?['name'],
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
      time: json['time'] ?? 'Unknown',
      days: List<String>.from(json['days'] ?? []),
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
      name: json['name'] ?? 'Unknown',
      country: json['country']?['name'] ?? 'Unknown',
      timezone: json['country']?['timezone'] ?? 'Unknown',
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
      medium: json['medium'] ?? '',
      original: json['original'] ?? '',
    );
  }
}
