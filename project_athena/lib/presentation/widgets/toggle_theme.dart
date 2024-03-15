import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_athena/providers/active_theme_provider.dart';

class ToggleTheme extends ConsumerStatefulWidget {
  const ToggleTheme({super.key});

  @override
  ConsumerState<ToggleTheme> createState() => _ToggleThemeState();
}

class _ToggleThemeState extends ConsumerState<ToggleTheme> {
  void toggleTheme(bool value) {
    ref.read(activeThemeProvider.notifier).state =
        value ? Themes.dark : Themes.light;
  }

  @override
  Widget build(BuildContext context) {
    return Switch.adaptive(
      activeColor: Theme.of(context).colorScheme.secondary,
      value: ref.watch(activeThemeProvider) == Themes.dark,
      onChanged: toggleTheme,
    );
  }
}
