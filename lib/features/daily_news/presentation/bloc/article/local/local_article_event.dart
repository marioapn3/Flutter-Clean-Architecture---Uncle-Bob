import 'package:clean_architecture_new_api/features/daily_news/domain/entities/article.dart';
import 'package:equatable/equatable.dart';

abstract class LocalArticleEvent extends Equatable {
  final ArticleEntity? article;

  LocalArticleEvent({this.article});
  @override
  List<Object?> get props => [article!];
}

class GetSavedArticles extends LocalArticleEvent {
  GetSavedArticles();
}

class RemoveArticle extends LocalArticleEvent {
  RemoveArticle(ArticleEntity article) : super(article: article);
}

class SaveArticle extends LocalArticleEvent {
  SaveArticle(ArticleEntity article) : super(article: article);
}
