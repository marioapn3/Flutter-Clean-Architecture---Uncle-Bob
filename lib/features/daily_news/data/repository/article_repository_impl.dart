import 'package:clean_architecture_new_api/core/constant/constant.dart';
import 'package:clean_architecture_new_api/core/resources/data_state.dart';
import 'package:clean_architecture_new_api/features/daily_news/data/data_sources/local/app_database.dart';
import 'package:clean_architecture_new_api/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:clean_architecture_new_api/features/daily_news/data/model/article.dart';
import 'package:clean_architecture_new_api/features/daily_news/domain/entities/article.dart';
import 'package:clean_architecture_new_api/features/daily_news/domain/repository/article_repository.dart';
import 'package:dio/dio.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  final AppDatabase _appDatabase;
  ArticleRepositoryImpl(this._newsApiService, this._appDatabase);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    // GET https://newsapi.org/v2/top-headlines?country=us&apiKey=f2fb669054a34ca38dec7ab8c1059352
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey: newsAPIKey,
        category: categoryQuery,
        country: countryQuery,
      );

      if (httpResponse.response.statusCode == 200) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataError(DioException(
          requestOptions: httpResponse.response.requestOptions,
          response: httpResponse.response,
          error: httpResponse.response.statusMessage,
          type: DioExceptionType.badResponse,
        ));
      }
    } on DioException catch (e) {
      return DataError(e);
    }
  }

  @override
  Future<List<ArticleModel>> getSavedArticles() async {
    return await _appDatabase.articleDao.getArticles();
  }

  @override
  Future<void> removeArticle(ArticleEntity article) {
    return _appDatabase.articleDao
        .deleteArticle(ArticleModel.fromEntity(article));
  }

  @override
  Future<void> saveArticle(ArticleEntity article) {
    return _appDatabase.articleDao
        .insertArticle(ArticleModel.fromEntity(article));
  }
}
