import '../util/request.dart';
import '../models/hots.dart';
import 'package:fquery/fquery.dart';

Future<Hots> getHotList() async {
  final res = await DioClient()
      .get('/search/repositories?q=stars:>10000&sort=stars&order=desc');
  final obj = Hots.fromJson(res.data);
  return obj;
}

useGetHotList() => useQuery(['Hots'], getHotList);
