import 'package:clean_architecture_new_api/core/resources/data_state.dart';
import 'package:clean_architecture_new_api/core/usecases/usecase.dart';
import 'package:clean_architecture_new_api/features/daily_news/domain/entities/article.dart';
import 'package:clean_architecture_new_api/features/daily_news/domain/repository/article_repository.dart';

class GetSavedArticleUseCase implements UseCase<List<ArticleEntity>, void> {
  final ArticleRepository _articleRepository;

  GetSavedArticleUseCase(this._articleRepository);

  @override
  Future<List<ArticleEntity>> call({void params}) {
    return _articleRepository.getSavedArticles();
  }
}
