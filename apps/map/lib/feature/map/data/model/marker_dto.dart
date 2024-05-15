class MarkerResponse {
  String? status;
  List<Data>? data;

  MarkerResponse({this.status, this.data});

  MarkerResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
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
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  double? lat;
  double? lon;
  int? uid;
  String? aqi;
  Station? station;

  Data({this.lat, this.lon, this.uid, this.aqi, this.station});

  Data.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lon = json['lon'];
    uid = json['uid'];
    aqi = json['aqi'];
    station =
    json['station'] != null ? new Station.fromJson(json['station']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['uid'] = this.uid;
    data['aqi'] = this.aqi;
    if (this.station != null) {
      data['station'] = this.station!.toJson();
    }
    return data;
  }
}

class Station {
  String? name;
  String? time;

  Station({this.name, this.time});

  Station.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['time'] = this.time;
    return data;
  }
}