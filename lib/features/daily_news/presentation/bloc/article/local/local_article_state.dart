import 'package:clean_architecture_new_api/features/daily_news/domain/entities/article.dart';
import 'package:equatable/equatable.dart';

abstract class LocalArticleState extends Equatable {
  final List<ArticleEntity>? articles;

  LocalArticleState({this.articles});

  @override
  List<Object?> get props => [articles!];
}

class LocalArticlesLoading extends LocalArticleState {
  LocalArticlesLoading();
}

class LocalArticlesDone extends LocalArticleState {
  LocalArticlesDone(List<ArticleEntity> articles) : super(articles: articles);
}
