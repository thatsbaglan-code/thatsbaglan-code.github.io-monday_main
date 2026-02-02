
import '../services/platform_helper.dart';
import 'package:file_selector/file_selector.dart';
import 'dart:convert';
import '../models/types.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/providers.dart';
import '../services/file_system_service.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // We access the abstract service interface, no Directory object exposed directly
    final fs = ref.watch(fileSystemServiceProvider);
    final fileListAsync = ref.watch(fileListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Monday Editor'),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Center(
        child: fs == null
            ? _buildWelcome(context, ref)
            : _buildFileList(context, ref, fileListAsync, fs),
      ),
    );
  }

  Widget _buildWelcome(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.folder_open, size: 64, color: Colors.indigo),
        const SizedBox(height: 20),
        const Text(
          'Open a Project Folder',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const Text('Select the folder containing your question JSON files'),
        const SizedBox(height: 30),
        ElevatedButton.icon(

          onPressed: () async {
            final fs = await pickDirectoryPlatform(context);
            if (fs != null) {
              ref.read(fileSystemServiceProvider.notifier).setService(fs);
            }
          },
          icon: const Icon(Icons.folder),
          label: const Text('Open Folder'),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          ),
        ),
      ],
    );
  }

  Widget _buildFileList(BuildContext context, WidgetRef ref, AsyncValue<List<String>> fileListAsync, IFileSystemService fs) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          color: Colors.indigo.shade50,
          child: Row(
            children: [
              const Icon(Icons.folder, color: Colors.indigo),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  fs.currentPath,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              IconButton(
                onPressed: () {
                  ref.read(fileSystemServiceProvider.notifier).setService(null);
                },
                icon: const Icon(Icons.close),
                tooltip: 'Close Project',
              ),
            ],
          ),
        ),
        Expanded(
          child: fileListAsync.when(
            data: (files) {
              if (files.isEmpty) {
                return const Center(child: Text('No .json files found'));
              }
              return ListView.separated(
                itemCount: files.length,
                separatorBuilder: (ctx, i) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final file = files[index];
                  return ListTile(
                    leading: const Icon(Icons.description, color: Colors.grey),
                    title: Text(file),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      ref.read(currentFilenameProvider.notifier).setFilename(file);
                      context.push('/editor');
                    },
                  );
                },
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Center(child: Text('Error: $err')),
          ),
        ),
      ],
    );
  }
}
