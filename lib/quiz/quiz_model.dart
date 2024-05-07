class QuizModel {
  String? id;
  String? question;
  List<Option>? options;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  QuizModel({
    this.id,
    this.question,
    this.options,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  // Factory constructor to create a QuizModel object from JSON data
  factory QuizModel.fromJson(Map<String, dynamic> json) => QuizModel(
    id: json["_id"],
    question: json["question"],
    options: json["options"] == null
        ? []
        : List<Option>.from(
        json["options"]!.map((x) => Option.fromJson(x))),
    createdAt: json["createdAt"] == null
        ? null
        : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null
        ? null
        : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  // Convert QuizModel object to JSON data
  Map<String, dynamic> toJson() => {
    "_id": id,
    "question": question,
    "options": options == null
        ? []
        : List<dynamic>.from(options!.map((x) => x.toJson())),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class Option {
  String? text;
  bool? isCorrect;
  String? id;

  Option({
    this.text,
    this.isCorrect,
    this.id,
  });

  // Factory constructor to create an Option object from JSON data
  factory Option.fromJson(Map<String, dynamic> json) => Option(
    text: json["text"],
    isCorrect: json["isCorrect"],
    id: json["_id"],
  );

  // Convert Option object to JSON data
  Map<String, dynamic> toJson() => {
    "text": text,
    "isCorrect": isCorrect,
    "_id": id,
  };
}
