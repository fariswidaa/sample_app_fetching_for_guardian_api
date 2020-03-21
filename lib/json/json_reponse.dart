/**
 * This file will contain PODO (plain old dart object),
 * and it is reponsible for desirializing the json response,
 * into dart objects.
 * 
 * The classes will represent the Response starting from the
 * Bottom level and go higher levels 
 */

// To parse this JSON data, do
//
//     final jsonResponse = jsonResponseFromJson(jsonString);

import 'dart:convert';

//JsonResponse jsonResponseFromJson(String str) => JsonResponse.fromJson(json.decode(str));

//String jsonResponseToJson(JsonResponse data) => json.encode(data.toJson());

class JsonResponse {
    Response response;

    JsonResponse({
        this.response,
    });

    factory JsonResponse.fromJson(Map<String, dynamic> json) {
    print ('json response factory method');
        return JsonResponse(
        response: Response.fromJson(json["response"]),
    );
}
    Map<String, dynamic> toJson() => {
        "response": response.toJson(),
    };
}

class Response {
    Tion edition;
    Tion section;
    List<Result> results;

    Response({
        this.edition,
        this.section,
        this.results,
    });

    factory Response.fromJson(Map<String, dynamic> json) => Response(
        edition: Tion.fromJson(json["edition"]),
        section: Tion.fromJson(json["section"]),
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "edition": edition.toJson(),
        "section": section.toJson(),
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class Tion {
    String id;
    String webTitle;
    String webUrl;
    String apiUrl;
    String code;
    List<Tion> editions;

    Tion({
        this.id,
        this.webTitle,
        this.webUrl,
        this.apiUrl,
        this.code,
        this.editions,
    });

    factory Tion.fromJson(Map<String, dynamic> json) => Tion(
        id: json["id"],
        webTitle: json["webTitle"],
        webUrl: json["webUrl"],
        apiUrl: json["apiUrl"],
        code: json["code"] == null ? null : json["code"],
        editions: json["editions"] == null ? null : List<Tion>.from(json["editions"].map((x) => Tion.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "webTitle": webTitle,
        "webUrl": webUrl,
        "apiUrl": apiUrl,
        "code": code == null ? null : code,
        "editions": editions == null ? null : List<dynamic>.from(editions.map((x) => x.toJson())),
    };
}

class Result {
    DateTime webPublicationDate;
    String webTitle;
    String webUrl;
    Fields fields;
   

    Result({
        this.webPublicationDate,
        this.webTitle,
        this.webUrl,
        this.fields,
    });

    factory Result.fromJson(Map<String, dynamic> json) {
    print ('Result factory method');
    return Result(
        webPublicationDate: DateTime.parse(json["webPublicationDate"]),
        webTitle: json["webTitle"],
        webUrl: json["webUrl"],
        fields: Fields.fromJson(json["fields"]),
    );
    
}
    Map<String, dynamic> toJson() => {
        "webPublicationDate": webPublicationDate.toIso8601String(),
        "webTitle": webTitle,
        "webUrl": webUrl,
        "fields": fields.toJson(),
    };
}

class Fields {
    String thumbnail;

    Fields({
        this.thumbnail,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        thumbnail: json["thumbnail"],
    );

    Map<String, dynamic> toJson() => {
        "thumbnail": thumbnail,
    };
}