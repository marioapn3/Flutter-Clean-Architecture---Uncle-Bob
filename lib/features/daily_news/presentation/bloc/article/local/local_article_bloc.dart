// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clean_architecture_new_api/features/daily_news/domain/usecases/get_saved_article.dart';
import 'package:clean_architecture_new_api/features/daily_news/domain/usecases/remove_article.dart';
import 'package:clean_architecture_new_api/features/daily_news/domain/usecases/save_article.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:clean_architecture_new_api/features/daily_news/presentation/bloc/article/local/local_article_event.dart';
import 'package:clean_architecture_new_api/features/daily_news/presentation/bloc/article/local/local_article_state.dart';

class LocalArticleBloc extends Bloc<LocalArticleEvent, LocalArticleState> {
  final GetSavedArticleUseCase _getSavedArticleUseCase;
  final RemoveArticleUseCase _removeArticleUseCase;
  final SaveArticleUseCase _saveArticleUseCase;

  LocalArticleBloc(
    this._getSavedArticleUseCase,
    this._removeArticleUseCase,
    this._saveArticleUseCase,
  ) : super(LocalArticlesLoading()) {
    on<GetSavedArticles>(onGetSavedArticles);
    on<RemoveArticle>(onRemoveArticle);
    on<SaveArticle>(onSaveArticle);
  }

  void onGetSavedArticles(
    GetSavedArticles event,
    Emitter<LocalArticleState> emit,
  ) async {
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDone(articles));
  }

  void onRemoveArticle(
    RemoveArticle event,
    Emitter<LocalArticleState> emit,
  ) async {
    await _removeArticleUseCase(params: event.article!);
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDone(articles));
  }

  void onSaveArticle(
    SaveArticle event,
    Emitter<LocalArticleState> emit,
  ) async {
    await _saveArticleUseCase(params: event.article!);
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDone(articles));
  }
}
