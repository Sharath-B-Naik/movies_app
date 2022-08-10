import 'package:flutter/widgets.dart';
import 'package:movies_app/model/movie_model.dart';
import 'package:movies_app/repository/api_repo.dart';
import 'package:movies_app/utils/app_utils.dart';

class HomeController extends ChangeNotifier {
  String? token;
  
  List<Movies>? _movies;
  List<Movies>? get movies => _movies;
  set movies(List<Movies>? value) {
    _movies = value;
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> getMoviesList(BuildContext context) async {
    final _resp = await ApiRepo.getMovieLists(token ?? '');
    // print(_resp.success!.data);

    if (_resp.success != null) {
      final _data = List.from(_resp.success!.data as List);

      List<Movies> _list = [];

      for (final json in _data) {
        _list.add(Movies.fromJson(json));
      }

      movies = _list;
    } else {
      movies = [];
      AppUtils.snackBar(context, _resp.failure!.message!);
    }
  }
}
