import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stash_android/core/presentation/viewmodel/base_view_model.dart';

class ViewModelProvider<T extends BaseViewModel> extends StatefulWidget {
  const ViewModelProvider({
    super.key,
    required this.create,
    this.child,
    this.builder,
    this.initialize,
  }) : assert(
          child != null || builder != null,
          'Provide child or builder',
        );

  final T Function() create;
  final Function(T)? initialize;
  final Widget? child;
  final Widget Function(BuildContext)? builder;

  @override
  State<ViewModelProvider<T>> createState() => _ViewModelProviderState<T>();
}

class _ViewModelProviderState<T extends BaseViewModel>
    extends State<ViewModelProvider<T>> {
  late final viewModel = widget.create();

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      widget.initialize?.call(viewModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => viewModel,
      child: widget.child ?? Builder(builder: widget.builder!),
      dispose: (_, __) => viewModel.dispose(),
    );
  }
}
