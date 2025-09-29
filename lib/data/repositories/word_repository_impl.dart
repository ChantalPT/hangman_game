import 'package:hangman_game/data/datasources/word_remote_datasource.dart';
import 'package:hangman_game/domain/repositories/word_repository.dart';

class WordRepositoryImpl implements WordRepository {
  final WordRemoteDatasource apiDataSource;

  WordRepositoryImpl(this.apiDataSource);

  @override
  Future<List<String>> getRandomWords(int count) {
    return apiDataSource.getRandomWords(count);
  }
}
