import 'package:json_annotation/json_annotation.dart';

part 'character.g.dart';

@JsonSerializable()
class Character {
  Character({
    required this.id,
    required this.name,
    required this.alternateNames,
    required this.species,
    required this.gender,
    required this.house,
    required this.dateOfBirth,
    required this.yearOfBirth,
    required this.wizard,
    required this.ancestry,
    required this.eyeColour,
    required this.hairColour,
    required this.wand,
    required this.patronus,
    required this.hogwartsStudent,
    required this.hogwartsStaff,
    required this.actor,
    required this.alternateActors,
    required this.alive,
    required this.image,
  });

  final String? id;
  final String? name;

  @JsonKey(name: 'alternate_names')
  final List<String>? alternateNames;
  final String? species;
  final String? gender;
  final String? house;
  final String? dateOfBirth;
  final int? yearOfBirth;
  final bool? wizard;
  final String? ancestry;
  final String? eyeColour;
  final String? hairColour;
  final Wand? wand;
  final String? patronus;
  final bool? hogwartsStudent;
  final bool? hogwartsStaff;
  final String? actor;

  @JsonKey(name: 'alternate_actors')
  final List<String>? alternateActors;
  final bool? alive;
  final String? image;

  Character copyWith({
    String? id,
    String? name,
    List<String>? alternateNames,
    String? species,
    String? gender,
    String? house,
    String? dateOfBirth,
    int? yearOfBirth,
    bool? wizard,
    String? ancestry,
    String? eyeColour,
    String? hairColour,
    Wand? wand,
    String? patronus,
    bool? hogwartsStudent,
    bool? hogwartsStaff,
    String? actor,
    List<String>? alternateActors,
    bool? alive,
    String? image,
  }) {
    return Character(
      id: id ?? this.id,
      name: name ?? this.name,
      alternateNames: alternateNames ?? this.alternateNames,
      species: species ?? this.species,
      gender: gender ?? this.gender,
      house: house ?? this.house,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      yearOfBirth: yearOfBirth ?? this.yearOfBirth,
      wizard: wizard ?? this.wizard,
      ancestry: ancestry ?? this.ancestry,
      eyeColour: eyeColour ?? this.eyeColour,
      hairColour: hairColour ?? this.hairColour,
      wand: wand ?? this.wand,
      patronus: patronus ?? this.patronus,
      hogwartsStudent: hogwartsStudent ?? this.hogwartsStudent,
      hogwartsStaff: hogwartsStaff ?? this.hogwartsStaff,
      actor: actor ?? this.actor,
      alternateActors: alternateActors ?? this.alternateActors,
      alive: alive ?? this.alive,
      image: image ?? this.image,
    );
  }

  factory Character.fromJson(Map<String, dynamic> json) => _$CharacterFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterToJson(this);

  @override
  String toString() {
    return "$id, $name, $alternateNames, $species, $gender, $house, $dateOfBirth, $yearOfBirth, $wizard, $ancestry, $eyeColour, $hairColour, $wand, $patronus, $hogwartsStudent, $hogwartsStaff, $actor, $alternateActors, $alive, $image, ";
  }
}

@JsonSerializable()
class Wand {
  Wand({
    required this.wood,
    required this.core,
    required this.length,
  });

  final String? wood;
  final String? core;
  final double? length;

  Wand copyWith({
    String? wood,
    String? core,
    double? length,
  }) {
    return Wand(
      wood: wood ?? this.wood,
      core: core ?? this.core,
      length: length ?? this.length,
    );
  }

  factory Wand.fromJson(Map<String, dynamic> json) => _$WandFromJson(json);

  Map<String, dynamic> toJson() => _$WandToJson(this);

  @override
  String toString() {
    return "$wood, $core, $length, ";
  }
}
