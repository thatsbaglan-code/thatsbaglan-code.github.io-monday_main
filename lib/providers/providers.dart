import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';
import '../models/types.dart';
import '../services/file_system_service.dart';


// Current Project Identifier
class FileSystemServiceNotifier extends Notifier<IFileSystemService?> {
  @override
  IFileSystemService? build() => null;
  void setService(IFileSystemService? service) => state = service;
}
final fileSystemServiceProvider = NotifierProvider<FileSystemServiceNotifier, IFileSystemService?>(FileSystemServiceNotifier.new);

// List of JSON files in the directory
final fileListProvider = FutureProvider<List<String>>((ref) async {
  final fs = ref.watch(fileSystemServiceProvider);
  if (fs == null) return [];
  return fs.listJsonFiles();
});

// Currently selected file
class FilenameNotifier extends Notifier<String?> {
  @override
  String? build() => null;
  void setFilename(String? name) => state = name;
}
final currentFilenameProvider = NotifierProvider<FilenameNotifier, String?>(FilenameNotifier.new);



// Questions in the selected file
class QuestionsNotifier extends AsyncNotifier<List<Question>> {
  @override
  Future<List<Question>> build() async {
    final fs = ref.watch(fileSystemServiceProvider);
    final filename = ref.watch(currentFilenameProvider);

    if (fs == null || filename == null) {
      return [];
    }

    try {
      return await fs.getFileContent(filename);
    } catch (e) {
      // AsyncNotifier automatically handles errors if we throw/return Future.error
      // But we can let build propagate it.
      rethrow;
    }
  }

  Future<void> save() async {
    final fs = ref.read(fileSystemServiceProvider);
    final filename = ref.read(currentFilenameProvider);
    if (fs == null || filename == null || !state.hasValue) return;
    
    try {
      await fs.saveFile(filename, state.value!);
    } catch (e) {
      rethrow;
    }
  }

  void updateQuestion(int index, Question question) {
    if (!state.hasValue) return;
    final questions = [...state.value!];
    questions[index] = question;
    state = AsyncValue.data(questions);
  }

  void addQuestion(Question question) {
     if (!state.hasValue) return;
     final questions = [...state.value!, question];
     state = AsyncValue.data(questions);
  }

  void removeQuestion(int index) {
    if (!state.hasValue) return;
    final questions = [...state.value!];
    questions.removeAt(index);
    state = AsyncValue.data(questions);
  }

  void setQuestions(List<Question> questions) {
    state = AsyncValue.data(questions);
  }
}

final questionsProvider = AsyncNotifierProvider<QuestionsNotifier, List<Question>>(QuestionsNotifier.new);

