class Permissions {
  final bool admin;
  final bool maintain;
  final bool push;
  final bool triage;
  final bool pull;

  Permissions({
    required this.admin,
    required this.maintain,
    required this.push,
    required this.triage,
    required this.pull,
  });

  factory Permissions.fromJson(Map<String, dynamic> json) {
    return Permissions(
      admin: json['admin'],
      maintain: json['maintain'],
      push: json['push'],
      triage: json['triage'],
      pull: json['pull'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'admin': admin,
      'maintain': maintain,
      'push': push,
      'triage': triage,
      'pull': pull,
    };
  }
}