import '../util/request.dart';
import '../models/favorite_list.dart';
import 'package:fquery/fquery.dart';

Future<FavoriteList> getFavoriteList({int page = 1, int pageSize = 50}) async {
  final res = await DioClient().get(
    '/search/repositories',
    queryParameters: {
      'q': 'stars:>10000',
      'sort': 'stars',
      'order': 'desc',
      'per_page': pageSize,
      'page': page,
    },
  );
  final obj = FavoriteList.fromJson(res.data);
  return obj;
}

UseQueryResult<FavoriteList, dynamic> useGetFavoriteList(
    {int page = 1, int pageSize = 10}) {
  return useQuery(['FavoriteList', page, pageSize],
      () => getFavoriteList(page: page, pageSize: pageSize));
}
