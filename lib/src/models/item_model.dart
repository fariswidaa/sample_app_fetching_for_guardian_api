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

// JsonResponse jsonResponseFromJson(String str) => JsonResponse.fromJson(json.decode(str));

//  String jsonResponseToJson(JsonResponse data) => json.encode(data.toJson());

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

    Response get get_response => response ;
}

class Response {

    List<Result> results;

    Response({
        this.results,
    });

    factory Response.fromJson(Map<String, dynamic> json) => Response( 
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };

    List<Result> get get_result =>results;
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

    DateTime get get_webPublicationDate => webPublicationDate;
    String get get_webTitle => webTitle ;
    String get get_webUrl => webUrl ;
    Fields get get_fields => fields ;
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

    String get get_thumbnail => thumbnail ;
}