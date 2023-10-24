import '../models/requests/breaking_news.request.dart';
import '../models/responses/breaking_news_response.dart';

abstract class ApiRepository {
  Future<BreakingNewsResponse> getBreakingNewsArticles({
    required BreakingNewsRequest request,
  });
}
