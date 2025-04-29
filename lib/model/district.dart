class District {
  static final List<String> district = <String>[
    'Otukpa',
    'Orokam',
    'Owukpa',
  ];

  static final List<String> otukpaWards = <String>[
    'AI-OONO I',
    'AI-OONO II',
    'AI-OONO III',
    'AI-OODO I',
    'AI-OODO II',
    'AI-AMEOCHAGBAHA',
  ];

  static final List<String> orokamWards = <String>[
    'OROKAM I',
    'OROKAM II',
    'OROKAM III',
  ];

  static final List<String> owukpaWards = <String>[
    'EHAJE I',
    'EHAJE II',
    'ITABONO I',
    'ITABONO II',
  ];

  static List<String> get districtList => district;

  static List<String> getWards(String ward) {
    int wardIndex = district.indexOf(ward);
    Wards wards = Wards.values[wardIndex];
    List<String> districtWard = switch (wards) {
      Wards.otukpa => otukpaWards,
      Wards.orokam => orokamWards,
      _ => owukpaWards
    };
    return districtWard;
  }
}

enum Wards {
  otukpa,
  orokam,
  owukpa;
}
