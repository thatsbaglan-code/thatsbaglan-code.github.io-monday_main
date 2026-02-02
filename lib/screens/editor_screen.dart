
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import '../models/types.dart';
import '../providers/providers.dart';
import '../services/file_system_service.dart';
import '../widgets/latex_preview.dart';

class EditorScreen extends ConsumerStatefulWidget {
  const EditorScreen({super.key});

  @override
  ConsumerState<EditorScreen> createState() => _EditorScreenState();
}

class _EditorScreenState extends ConsumerState<EditorScreen> {
  int _selectedIdx = 0;
  bool _showPreview = true;
  double _previewWidth = 400;
  bool _saving = false;

  @override
  Widget build(BuildContext context) {
    final questionsAsync = ref.watch(questionsProvider);
    final filename = ref.watch(currentFilenameProvider);

    return Scaffold(
      body: CallbackShortcuts(
        bindings: {
          const SingleActivator(LogicalKeyboardKey.keyS, meta: true): () => _save(),
          const SingleActivator(LogicalKeyboardKey.keyS, control: true): () => _save(),
          const SingleActivator(LogicalKeyboardKey.enter, meta: true): () => _addNewQuestion(),
          const SingleActivator(LogicalKeyboardKey.enter, control: true): () => _addNewQuestion(),
        },
        child: Focus(
          autofocus: true,
          child: Column(
            children: [
              // Header
              _buildHeader(context, filename),
              
              // Main Area
              Expanded(
                child: questionsAsync.when(
                  data: (questions) {
                    if (questions.isEmpty) {
                      return Center(
                        child: ElevatedButton.icon(
                          onPressed: _addNewQuestion,
                          icon: const Icon(Icons.add),
                          label: const Text('Add First Question'),
                        ),
                      );
                    }
                    
                    // Ensure selection is valid
                    if (_selectedIdx >= questions.length) _selectedIdx = 0;
                    final currentQ = questions[_selectedIdx];

                    return Row(
                      children: [
                        // Sidebar
                        SizedBox(
                          width: 300,
                          child: _buildSidebar(questions),
                        ),
                        const VerticalDivider(width: 1),
                        
                        // Editor Form
                        Expanded(
                          child: _buildEditor(currentQ),
                        ),
                        
                        // Preview Pane
                        if (_showPreview) ...[
                          MouseRegion(
                            cursor: SystemMouseCursors.resizeColumn,
                            child: GestureDetector(
                              onHorizontalDragUpdate: (details) {
                                setState(() {
                                  _previewWidth -= details.delta.dx;
                                  if (_previewWidth < 200) _previewWidth = 200;
                                  if (_previewWidth > 600) _previewWidth = 600; 
                                });
                              },
                              child: Container(width: 5, color: Colors.grey.shade200),
                            ),
                          ),
                          SizedBox(
                            width: _previewWidth,
                            child: _buildPreview(currentQ),
                          ),
                        ],
                      ],
                    );
                  },
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (err, stack) => Center(child: Text('Error: $err')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, String? filename) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))],
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.pop(),
          ),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(filename ?? 'Untitled', style: const TextStyle(fontWeight: FontWeight.bold)),
              const Text('Editing Exam Content', style: TextStyle(fontSize: 10, color: Colors.grey)),
            ],
          ),
          const Spacer(),
          IconButton(
            icon: Icon(_showPreview ? Icons.visibility : Icons.visibility_off),
            onPressed: () => setState(() => _showPreview = !_showPreview),
            tooltip: 'Toggle Preview',
          ),
          const SizedBox(width: 10),
          ElevatedButton.icon(
            onPressed: _saving ? null : _save,
            icon: _saving ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2)) : const Icon(Icons.save, size: 16),
            label: const Text('Save'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo, foregroundColor: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildSidebar(List<Question> questions) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton.icon(
            onPressed: _addNewQuestion,
            icon: const Icon(Icons.add),
            label: const Text('Add Question'),
            style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 40)),
          ),
        ),
        Expanded(
          child: ListView.separated(
            itemCount: questions.length,
            separatorBuilder: (ctx, i) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final q = questions[index];
              final isSelected = index == _selectedIdx;
              return ListTile(
                selected: isSelected,
                selectedTileColor: Colors.indigo.shade50,
                title: Text('Question ${q.QuestionNumber}'),
                subtitle: Text(q.QuestionID, style: const TextStyle(fontSize: 10, fontFamily: 'monospace')),
                trailing: Text(q.QuestionType, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10)),
                onTap: () => setState(() => _selectedIdx = index),
                dense: true,
              );
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.grey.shade100,
          child: Text('${questions.length} Questions', style: const TextStyle(fontSize: 10)),
        ),
      ],
    );
  }

  Widget _buildEditor(Question q) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        // Metadata
        Text('METADATA', style: Theme.of(context).textTheme.labelSmall),
        const SizedBox(height: 8),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
             _buildSmallInput('Number', q.QuestionNumber.toString(), (v) => _updateQ(q.copyWith(QuestionNumber: int.tryParse(v) ?? q.QuestionNumber))),
             _buildTypeSelector(q),
             _buildSmallInput('Chapter', q.Chapter, (v) => _updateQ(q.copyWith(Chapter: v))),
             _buildSmallInput('Topic', q.Topic, (v) => _updateQ(q.copyWith(Topic: v))),
             _buildSmallInput('Grade', q.Grade, (v) => _updateQ(q.copyWith(Grade: v))),
             _buildSmallInput('Level', q.Level, (v) => _updateQ(q.copyWith(Level: v))),
          ],
        ),
        
        const Divider(height: 32),
        
        // Content
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('CONTENT', style: Theme.of(context).textTheme.labelSmall),
            TextButton.icon(
              onPressed: () => _pickImage(),
              icon: const Icon(Icons.image, size: 16),
              label: Text(q.QuestionImage != null ? 'Change Image' : 'Add Image'),
            )
          ],
        ),
        
        if (q.QuestionImage != null)
           Padding(
             padding: const EdgeInsets.symmetric(vertical: 8.0),
             child: Row(
               children: [
                 const Icon(Icons.image, size: 16, color: Colors.grey),
                 const SizedBox(width: 8),
                 Expanded(child: Text(q.QuestionImage!, style: const TextStyle(fontFamily: 'monospace', fontSize: 12))),
                 IconButton(icon: const Icon(Icons.delete, size: 16), onPressed: () => _updateQ(q.copyWith(QuestionImage: null))),
               ],
             ),
           ),

        const SizedBox(height: 8),
        TextField(
          controller: TextEditingController(text: q.QuestionLatex)..selection = TextSelection.collapsed(offset: q.QuestionLatex.length),
          maxLines: 5,
          decoration: const InputDecoration(
            labelText: 'Question Latex',
            border: OutlineInputBorder(),
          ),
          onChanged: (v) => _updateQ(q.copyWith(QuestionLatex: v)),
        ),
        
        const SizedBox(height: 16),
        TextField(
          controller: TextEditingController(text: q.HintLatex)..selection = TextSelection.collapsed(offset: q.HintLatex.length),
           maxLines: 2,
           decoration: const InputDecoration(
             labelText: 'Hint Latex',
             border: OutlineInputBorder(),
           ),
           onChanged: (v) => _updateQ(q.copyWith(HintLatex: v)),
        ),

        const SizedBox(height: 16),
        TextField(
          controller: TextEditingController(text: q.SolutionLatex)..selection = TextSelection.collapsed(offset: q.SolutionLatex.length),
           maxLines: 3,
           decoration: const InputDecoration(
             labelText: 'Solution Latex',
             border: OutlineInputBorder(),
           ),
           onChanged: (v) => _updateQ(q.copyWith(SolutionLatex: v)),
        ),
        
        const Divider(height: 32),
        
        // Answers
       Text('ANSWERS (${q.QuestionType})', style: Theme.of(context).textTheme.labelSmall),
       const SizedBox(height: 8),
       _buildAnswersEditor(q),
      ],
    );
  }
  
  Widget _buildAnswersEditor(Question q) {
    if (q.QuestionType == 'A' || q.QuestionType == 'B') {
      final answers = q.AnswersJSON ?? [];
      return Column(
        children: [
          ...answers.asMap().entries.map((entry) {
            final idx = entry.key;
            final ans = entry.value;
            return Card(
              margin: const EdgeInsets.only(bottom: 8),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Checkbox(
                      value: ans.isCorrect, 
                      onChanged: (v) {
                        final newAns = [...answers];
                        if (q.QuestionType == 'A' && v == true) {
                           for (var i=0; i<newAns.length; i++) newAns[i] = newAns[i].copyWith(isCorrect: false);
                        }
                        newAns[idx] = ans.copyWith(isCorrect: v ?? false);
                        _updateQ(q.copyWith(AnswersJSON: newAns));
                      }
                    ),
                    Expanded(
                      child: TextField(
                        controller: TextEditingController(text: ans.option)..selection = TextSelection.collapsed(offset: ans.option.length),
                        decoration: InputDecoration(hintText: 'Option ${idx + 1}', border: InputBorder.none),
                        onChanged: (v) {
                           final newAns = [...answers];
                           newAns[idx] = ans.copyWith(option: v);
                           _updateQ(q.copyWith(AnswersJSON: newAns));
                        },
                      ),
                    ),
                    IconButton(icon: const Icon(Icons.delete), onPressed: () {
                         final newAns = [...answers];
                         newAns.removeAt(idx);
                         _updateQ(q.copyWith(AnswersJSON: newAns));
                    })
                  ],
                ),
              ),
            );
          }),
          TextButton.icon(
            onPressed: () {
               final newAns = [...?q.AnswersJSON, const AnswerOption()];
               _updateQ(q.copyWith(AnswersJSON: newAns));
            }, 
            icon: const Icon(Icons.add), 
            label: const Text('Add Option')
          )
        ],
      );
    } 
    // Types C and D (SubQuestions)
    final subs = q.SubQuestions ?? [];
    return Column(
      children: subs.asMap().entries.map((entry) {
        final idx = entry.key;
        final sub = entry.value;
        return Card(
          color: Colors.grey.shade50,
          margin: const EdgeInsets.only(bottom: 16),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Row(
                   children: [
                     Text(sub.id, style: const TextStyle(fontWeight: FontWeight.bold)),
                     const SizedBox(width: 8),
                     Expanded(
                       child: TextField(
                         controller: TextEditingController(text: sub.subquestion)..selection = TextSelection.collapsed(offset: sub.subquestion.length),
                         decoration: const InputDecoration(hintText: 'SubQuestion Text', isDense: true),
                         onChanged: (v) {
                            final newSubs = [...subs];
                            newSubs[idx] = sub.copyWith(subquestion: v);
                            _updateQ(q.copyWith(SubQuestions: newSubs));
                         },
                       ),
                     ),
                   ],
                 ),
                 const SizedBox(height: 8),
                 // Sub Options
                 ...sub.options.asMap().entries.map((optEntry) {
                    final oIdx = optEntry.key;
                    final opt = optEntry.value;
                    return Row(
                      children: [
                        Checkbox(
                          value: opt.isCorrect, 
                          onChanged: (v) {
                             final newSubs = [...subs];
                             final newOpts = [...sub.options];
                             // If maxSelected is 1, reset others
                             if (sub.maxSelected == 1 && v == true) {
                               for (var i=0; i<newOpts.length; i++) newOpts[i] = newOpts[i].copyWith(isCorrect: false);
                             }
                             newOpts[oIdx] = opt.copyWith(isCorrect: v ?? false);
                             newSubs[idx] = sub.copyWith(options: newOpts);
                             _updateQ(q.copyWith(SubQuestions: newSubs));
                          }
                        ),
                        Expanded(child: TextField(
                          controller: TextEditingController(text: opt.option)..selection = TextSelection.collapsed(offset: opt.option.length),
                          decoration: const InputDecoration(isDense: true, border: InputBorder.none),
                          onChanged: (v) {
                              final newSubs = [...subs];
                              final newOpts = [...sub.options];
                              newOpts[oIdx] = opt.copyWith(option: v);
                              newSubs[idx] = sub.copyWith(options: newOpts);
                              _updateQ(q.copyWith(SubQuestions: newSubs));
                          },
                        ))
                      ],
                    );
                 }),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildPreview(Question q) {
    final fs = ref.watch(fileSystemServiceProvider);
    
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('PREVIEW', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
          const Divider(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Question ${q.QuestionNumber} (${q.QuestionType})', style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  
                  if (q.QuestionImage != null && fs != null)
                     FutureBuilder<Uint8List?>(
                       future: fs.getImageBytes(q.QuestionImage!),
                       builder: (ctx, snapshot) {
                         if (snapshot.hasData) {
                           return Image.memory(snapshot.data!);
                         }
                         return const SizedBox.shrink();
                       }
                     ),

                  LatexPreview(content: q.QuestionLatex),
                  const SizedBox(height: 20),
                  if (q.AnswersJSON != null)
                    ...q.AnswersJSON!.map((a) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        children: [
                          Icon(a.isCorrect ? Icons.check_circle_outline : Icons.circle_outlined, 
                              size: 16, color: a.isCorrect ? Colors.green : Colors.grey),
                          const SizedBox(width: 8),
                          Expanded(child: LatexPreview(content: a.option)),
                        ],
                      ),
                    )),
                    
                    if (q.SubQuestions != null)
                      ...q.SubQuestions!.map((sub) => Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(sub.subquestion, style: const TextStyle(fontWeight: FontWeight.w600)),
                            ...sub.options.map((opt) => Padding(
                              padding: const EdgeInsets.only(left: 16, top: 2),
                              child: Row(
                                 children: [
                                  Icon(opt.isCorrect ? Icons.check_circle_outline : Icons.circle_outlined, 
                                      size: 14, color: opt.isCorrect ? Colors.green : Colors.grey),
                                  const SizedBox(width: 8),
                                  Text(opt.option),
                                 ]
                              ),
                            ))
                          ],
                        ),
                      )),
                      
                  if (q.HintLatex.isNotEmpty) ...[
                     const SizedBox(height: 20),
                     const Text('Hint:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                     Container(
                       padding: const EdgeInsets.all(8),
                       color: Colors.yellow.shade50,
                       child: LatexPreview(content: q.HintLatex),
                     )
                  ],

                  if (q.SolutionLatex.isNotEmpty) ...[
                     const SizedBox(height: 20),
                     const Text('Solution:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                     Container(
                       padding: const EdgeInsets.all(8),
                       color: Colors.green.shade50,
                       child: LatexPreview(content: q.SolutionLatex),
                     )
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helpers
  Widget _buildSmallInput(String label, String value, Function(String) onChanged) {
    return SizedBox(
      width: 60,
      child: TextField(
        controller: TextEditingController(text: value)..selection = TextSelection.collapsed(offset: value.length),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          labelText: label,
          contentPadding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
          border: const OutlineInputBorder(),
        ),
        onChanged: onChanged,
      ),
    );
  }
  
  Widget _buildTypeSelector(Question q) {
     return SizedBox(
       width: 80,
       child: DropdownButtonFormField<String>(
         value: q.QuestionType,
         decoration: const InputDecoration(labelText: 'Type', border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(horizontal: 8)),
         items: ['A', 'B', 'C', 'D'].map((t) => DropdownMenuItem(value: t, child: Text(t))).toList(),
         onChanged: (v) {
            if (v != null && v != q.QuestionType) {
              // Reset answers/subs based on new type
              var newQ = q.copyWith(QuestionType: v);
              if (v == 'A') {
                newQ = newQ.copyWith(AnswersJSON: List.filled(4, const AnswerOption()), SubQuestions: null);
              } else if (v == 'B') {
                newQ = newQ.copyWith(AnswersJSON: List.filled(6, const AnswerOption()), SubQuestions: null);
              } else if (v == 'C') {
                newQ = newQ.copyWith(AnswersJSON: null, SubQuestions: List.generate(2, (i) => SubQuestion(id: 'Q${i+1}', options: List.filled(3, const SubQuestionOption()))));
              } else if (v == 'D') {
                 newQ = newQ.copyWith(AnswersJSON: null, SubQuestions: List.generate(5, (i) => SubQuestion(id: 'Q${i+1}', options: List.filled(4, const SubQuestionOption()))));
              }
              _updateQ(newQ);
            }
         }
       ),
     );
  }

  void _updateQ(Question q) {
    // Generate ID automatically
    final pad = (String s, int n) => s.padLeft(n, '0');
    final newId = '${pad(q.Chapter, 2)}${pad(q.Topic, 2)}${pad(q.Grade, 2)}${pad(q.Level, 2)}${pad(q.QuestionNumber.toString(), 4)}';
    
    final updatedQ = q.copyWith(QuestionID: newId);
    ref.read(questionsProvider.notifier).updateQuestion(_selectedIdx, updatedQ);
  }

  Future<void> _save() async {
    setState(() => _saving = true);
    try {
      await ref.read(questionsProvider.notifier).save();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Saved!')));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red));
    } finally {
      setState(() => _saving = false);
    }
  }

  Future<void> _addNewQuestion() async {
    final questions = ref.read(questionsProvider).value ?? [];
    Question baseQ;
    if (questions.isNotEmpty) {
      final last = questions.last;
      baseQ = last.copyWith(
        QuestionNumber: last.QuestionNumber + 1,
        QuestionLatex: 'New Question',
        QuestionID: '',
        QuestionImage: null
      );
    } else {
      baseQ = const Question(
        QuestionID: '', QuestionNumber: 1, QuestionType: 'A', Chapter: '01', Topic: '01', Grade: '01', Level: '01'
      );
    }
    
    ref.read(questionsProvider.notifier).addQuestion(baseQ);
    // Select the new question (needs delay for build)
    Future.microtask(() {
       setState(() {
         _selectedIdx = (ref.read(questionsProvider).value?.length ?? 1) - 1;
       });
       // Update ID trigger
       _updateQ(baseQ);
    });
  }
  
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final fs = ref.read(fileSystemServiceProvider);
      if (fs != null) {
        final q = ref.read(questionsProvider).value![_selectedIdx];
        final ext = image.name.split('.').last;
        final newName = '${q.QuestionID}_${DateTime.now().millisecondsSinceEpoch}.$ext';
        // Need to use File for native, but we can't import it.
        // On native implementation of saveImage expects File.
        // But here we have XFile.
        // We can pass XFile path?
        // Native service `saveImage` expects `dynamic imageFile`.
        // Native implementation checks `if (imageFile is! File)`.
        // We need to wrap it in File if on native. 
        // OR we change native implementation to accept XFile or String path.
        // Ideally XFile is cross platform.
        // I will change native/web impl to accept XFile to be cleaner.
        // But for now, passing File(image.path) was what I planned but I can't import File.
        
        // I will use `image` (XFile). And update Native Service to handle XFile.
        final savedPath = await fs.saveImage(newName, image);
        _updateQ(q.copyWith(QuestionImage: savedPath));
      }
    }
  }
}
