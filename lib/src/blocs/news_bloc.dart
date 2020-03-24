import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sample_app_fetching/src/models/item_model.dart';

class NewsBloc {
final _repository = Repository();
final _newsFetcher = PublishSubject<JsonResponse>();

Observable<JsonResponse> get allNews => _newsFetcher.stream;

fetchAllNews() async {
JsonResponse itemModel = await _repository.fetchAllMovies();
_newsFetcher.sink.add(itemModel);
}

dispose() {
_newsFetcher.close();
}
}

final bloc = NewsBloc();