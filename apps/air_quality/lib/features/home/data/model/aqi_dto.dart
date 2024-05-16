class AQIDetailResponse {
  String? status;
  Data? data;

  AQIDetailResponse({this.status, this.data});

  AQIDetailResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? aqi;
  int? idx;
  List<Attributions>? attributions;
  City? city;
  String? dominentpol;
  Iaqi? iaqi;
  Time? time;
  Forecast? forecast;
  Debug? debug;

  Data(
      {this.aqi,
      this.idx,
      this.attributions,
      this.city,
      this.dominentpol,
      this.iaqi,
      this.time,
      this.forecast,
      this.debug});

  Data.fromJson(Map<String, dynamic> json) {
    aqi = json['aqi'];
    idx = json['idx'];
    if (json['attributions'] != null) {
      attributions = <Attributions>[];
      json['attributions'].forEach((v) {
        attributions!.add(new Attributions.fromJson(v));
      });
    }
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    dominentpol = json['dominentpol'];
    iaqi = json['iaqi'] != null ? new Iaqi.fromJson(json['iaqi']) : null;
    time = json['time'] != null ? new Time.fromJson(json['time']) : null;
    forecast = json['forecast'] != null
        ? new Forecast.fromJson(json['forecast'])
        : null;
    debug = json['debug'] != null ? new Debug.fromJson(json['debug']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['aqi'] = this.aqi;
    data['idx'] = this.idx;
    if (this.attributions != null) {
      data['attributions'] = this.attributions!.map((v) => v.toJson()).toList();
    }
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    data['dominentpol'] = this.dominentpol;
    if (this.iaqi != null) {
      data['iaqi'] = this.iaqi!.toJson();
    }
    if (this.time != null) {
      data['time'] = this.time!.toJson();
    }
    if (this.forecast != null) {
      data['forecast'] = this.forecast!.toJson();
    }
    if (this.debug != null) {
      data['debug'] = this.debug!.toJson();
    }
    return data;
  }
}

class Attributions {
  String? url;
  String? name;
  String? logo;

  Attributions({this.url, this.name, this.logo});

  Attributions.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    name = json['name'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['name'] = this.name;
    data['logo'] = this.logo;
    return data;
  }
}

class City {
  List<double>? geo;
  String? name;
  String? url;
  String? location;

  City({this.geo, this.name, this.url, this.location});

  City.fromJson(Map<String, dynamic> json) {
    geo = json['geo'].cast<double>();
    name = json['name'];
    url = json['url'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['geo'] = this.geo;
    data['name'] = this.name;
    data['url'] = this.url;
    data['location'] = this.location;
    return data;
  }
}

class Iaqi {
  Dew? dew;
  Dew? h;
  Dew? no2;
  Dew? o3;
  Dew? p;
  Dew? pm10;
  Dew? pm25;
  Dew? so2;
  Dew? t;
  Dew? w;
  Dew? wg;

  Iaqi(
      {this.dew,
      this.h,
      this.no2,
      this.o3,
      this.p,
      this.pm10,
      this.pm25,
      this.so2,
      this.t,
      this.w,
      this.wg});

  Iaqi.fromJson(Map<String, dynamic> json) {
    dew = json['dew'] != null ? new Dew.fromJson(json['dew']) : null;
    h = json['h'] != null ? new Dew.fromJson(json['h']) : null;
    no2 = json['no2'] != null ? new Dew.fromJson(json['no2']) : null;
    o3 = json['o3'] != null ? new Dew.fromJson(json['o3']) : null;
    p = json['p'] != null ? new Dew.fromJson(json['p']) : null;
    pm10 = json['pm10'] != null ? new Dew.fromJson(json['pm10']) : null;
    pm25 = json['pm25'] != null ? new Dew.fromJson(json['pm25']) : null;
    so2 = json['so2'] != null ? new Dew.fromJson(json['so2']) : null;
    t = json['t'] != null ? new Dew.fromJson(json['t']) : null;
    w = json['w'] != null ? new Dew.fromJson(json['w']) : null;
    wg = json['wg'] != null ? new Dew.fromJson(json['wg']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dew != null) {
      data['dew'] = this.dew!.toJson();
    }
    if (this.h != null) {
      data['h'] = this.h!.toJson();
    }
    if (this.no2 != null) {
      data['no2'] = this.no2!.toJson();
    }
    if (this.o3 != null) {
      data['o3'] = this.o3!.toJson();
    }
    if (this.p != null) {
      data['p'] = this.p!.toJson();
    }
    if (this.pm10 != null) {
      data['pm10'] = this.pm10!.toJson();
    }
    if (this.pm25 != null) {
      data['pm25'] = this.pm25!.toJson();
    }
    if (this.so2 != null) {
      data['so2'] = this.so2!.toJson();
    }
    if (this.t != null) {
      data['t'] = this.t!.toJson();
    }
    if (this.w != null) {
      data['w'] = this.w!.toJson();
    }
    if (this.wg != null) {
      data['wg'] = this.wg!.toJson();
    }
    return data;
  }
}

class Dew {
  num? v;

  Dew({this.v});

  Dew.fromJson(Map<String, dynamic> json) {
    v = json['v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['v'] = this.v;
    return data;
  }
}

class Time {
  String? s;
  String? tz;
  int? v;
  String? iso;

  Time({this.s, this.tz, this.v, this.iso});

  Time.fromJson(Map<String, dynamic> json) {
    s = json['s'];
    tz = json['tz'];
    v = json['v'];
    iso = json['iso'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['s'] = this.s;
    data['tz'] = this.tz;
    data['v'] = this.v;
    data['iso'] = this.iso;
    return data;
  }
}

class Forecast {
  Daily? daily;

  Forecast({this.daily});

  Forecast.fromJson(Map<String, dynamic> json) {
    daily = json['daily'] != null ? new Daily.fromJson(json['daily']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.daily != null) {
      data['daily'] = this.daily!.toJson();
    }
    return data;
  }
}

class Daily {
  List<DailyForecast>? o3;
  List<DailyForecast>? pm10;
  List<DailyForecast>? pm25;

  Daily({this.o3, this.pm10, this.pm25});

  Daily.fromJson(Map<String, dynamic> json) {
    if (json['o3'] != null) {
      o3 = <DailyForecast>[];
      json['o3'].forEach((v) {
        o3!.add(new DailyForecast.fromJson(v));
      });
    }
    if (json['pm10'] != null) {
      pm10 = <DailyForecast>[];
      json['pm10'].forEach((v) {
        pm10!.add(new DailyForecast.fromJson(v));
      });
    }
    if (json['pm25'] != null) {
      pm25 = <DailyForecast>[];
      json['pm25'].forEach((v) {
        pm25!.add(new DailyForecast.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.o3 != null) {
      data['o3'] = this.o3!.map((v) => v.toJson()).toList();
    }
    if (this.pm10 != null) {
      data['pm10'] = this.pm10!.map((v) => v.toJson()).toList();
    }
    if (this.pm25 != null) {
      data['pm25'] = this.pm25!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DailyForecast {
  int? avg;
  String? day;
  int? max;
  int? min;

  DailyForecast({this.avg, this.day, this.max, this.min});

  DailyForecast.fromJson(Map<String, dynamic> json) {
    avg = json['avg'];
    day = json['day'];
    max = json['max'];
    min = json['min'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avg'] = this.avg;
    data['day'] = this.day;
    data['max'] = this.max;
    data['min'] = this.min;
    return data;
  }
}

class Debug {
  String? sync;

  Debug({this.sync});

  Debug.fromJson(Map<String, dynamic> json) {
    sync = json['sync'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sync'] = this.sync;
    return data;
  }
}
