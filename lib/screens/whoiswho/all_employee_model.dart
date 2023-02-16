// To parse this JSON data, do
//
//     final allEmployees = allEmployeesFromJson(jsonString);

import 'dart:convert';

List<AllEmployees?> allEmployeesFromJson(String str) => json.decode(str) == null ? [] : List<AllEmployees?>.from(json.decode(str)!.map((x) => AllEmployees.fromJson(x)));

String allEmployeesToJson(List<AllEmployees?>? data) => json.encode(data == null ? [] : List<dynamic>.from(data!.map((x) => x!.toJson())));

class AllEmployees {
  AllEmployees({
    this.title,
    this.extpEmail,
    this.extpPhone,
    this.extpBirthday,
    this.extpPosition,
    this.featuredImage,
    this.categories,
    this.extpLocation,
  });

  String? title;
  String? extpEmail;
  String? extpPhone;
  String? extpBirthday;
  String? extpPosition;
  String? featuredImage;
  List<Category?>? categories;
  dynamic extpLocation;

  factory AllEmployees.fromJson(Map<String, dynamic> json) => AllEmployees(
    title: json["title"],
    extpEmail: json["extp_email"],
    extpPhone: json["extp_phone"],
    extpBirthday: json["extp_birthday"],
    extpPosition: json["extp_position"],
    featuredImage: json["featured_image"] ?? "",
    categories: json["categories"] == null ? [] : List<Category?>.from(json["categories"]!.map((x) => Category.fromJson(x))),
    extpLocation: json["extp_location"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "extp_email": extpEmail,
    "extp_phone": extpPhone,
    "extp_birthday": extpBirthday,
    "extp_position": extpPosition,
    "featured_image": featuredImage,
    "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x!.toJson())),
    "extp_location": extpLocation,
  };
}

class Category {
  Category({
    this.termId,
    this.name,
    this.slug,
    this.termGroup,
    this.termTaxonomyId,
    this.taxonomy,
    this.description,
    this.parent,
    this.count,
    this.filter,
    this.termOrder,
  });

  int? termId;
  String? name;
  String? slug;
  int? termGroup;
  int? termTaxonomyId;
  Taxonomy? taxonomy;
  String? description;
  int? parent;
  int? count;
  Filter? filter;
  String? termOrder;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    termId: json["term_id"],
    name: json["name"],
    slug: json["slug"],
    termGroup: json["term_group"],
    termTaxonomyId: json["term_taxonomy_id"],
    taxonomy: taxonomyValues!.map[json["taxonomy"]],
    description: json["description"],
    parent: json["parent"],
    count: json["count"],
    filter: filterValues!.map[json["filter"]],
    termOrder: json["term_order"],
  );

  Map<String, dynamic> toJson() => {
    "term_id": termId,
    "name": name,
    "slug": slug,
    "term_group": termGroup,
    "term_taxonomy_id": termTaxonomyId,
    "taxonomy": taxonomyValues.reverse![taxonomy],
    "description": description,
    "parent": parent,
    "count": count,
    "filter": filterValues.reverse![filter],
    "term_order": termOrder,
  };
}

enum Filter { RAW }

final filterValues = EnumValues({
  "raw": Filter.RAW
});

enum Taxonomy { EXTP_CAT, EXTP_LOC }

final taxonomyValues = EnumValues({
  "extp_cat": Taxonomy.EXTP_CAT,
  "extp_loc": Taxonomy.EXTP_LOC
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
