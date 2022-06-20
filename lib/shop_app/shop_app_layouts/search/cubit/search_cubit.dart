import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testcashehelper/Components/components.dart';
import 'package:testcashehelper/Shared/Local/sharedpreferences.dart';
import 'package:testcashehelper/Shared/Remote/DioHelper.dart';
import 'package:testcashehelper/shop_app/shop_app_layouts/search/cubit/search_states.dart';

import '../../../../Shared/endpoints.dart';
import '../../../../models/shop_app/search_model.dart';
import '../../../../models/shop_app/test.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(InitialState());

  static SearchCubit get(context) => BlocProvider.of(context);

 Search? model1;

  void searchData( String text) {
    DioHelper.postdata(
      url: SEARCH,
      token: token,
      data: {
        'text': text,
      },
      ).then((value) {
      model1 = Search.fromJson(value.data);
      emit(SearchSuccess());
    }).catchError((error) {
      emit(SearchError());
    });
  }
}
