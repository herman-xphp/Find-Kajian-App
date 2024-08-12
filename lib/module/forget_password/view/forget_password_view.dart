import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/forget_password_controller.dart';
import '../state/forget_password_state.dart';
import 'package:get_it/get_it.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  ForgetPasswordController controller = ForgetPasswordController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<ForgetPasswordController>()) {
      GetIt.I.unregister<ForgetPasswordController>();
    }
    GetIt.I.registerSingleton(controller);
    controller.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => controller.ready(),
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => controller,
      child: BlocListener<ForgetPasswordController, ForgetPasswordState>(
        listener: (context, state) {},
        child: BlocBuilder<ForgetPasswordController, ForgetPasswordState>(
          builder: (context, state) {
            final bloc = context.read<ForgetPasswordController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    ForgetPasswordController controller,
    ForgetPasswordState state,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lupa Password',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Counter: ${state.counter}',
            style: const TextStyle(fontSize: 24),
          ),
          IconButton(
            onPressed: () => controller.increment(),
            icon: const Icon(
              Icons.add,
              size: 24.0,
            ),
          ),
        ],
      ),
    );
  }
}
