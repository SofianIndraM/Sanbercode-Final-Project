import 'package:equatable/equatable.dart';

class SourceModel extends Equatable {
  final String name;

  SourceModel({
    this.name = '',
  });

  factory SourceModel.fromJson(Map<String, dynamic> json) => SourceModel(
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
      };

  @override
  List<Object?> get props => [
        name,
      ];
}
