import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/register_cubit/register_cubit.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('New User')),
        body: BlocProvider(
          create: (context) => RegisterCubit(),
          child: const _RegisterView(),
        ));
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        child: Column(
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlutterLogo(
                size: 100,
              ),
              _RegisterForm(),
              SizedBox(
                height: 20,
              ),
            ]),
      ),
    ));
  }
}

class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // Don't need it becasue all move to state gestor formz
  String username = '';
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();
    final username = registerCubit.state.username;
    final password = registerCubit.state.password;

    return Form(
        child: Column(
      children: [
        CustomTextFormField(
          label: 'User Name',
          onChanged: registerCubit.usernameChanged,
          errorMessage: username.errorMessage,
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextFormField(
          label: 'Email',
          onChanged: (value) {
            registerCubit.emailChanged(value);
          },
          validator: (value) {
            if (value == null || value.isEmpty) return 'Field is required';
            if (value.trim().isEmpty) return 'Field is required';
            final emailRegExp = RegExp(
              r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
            );

            if (!emailRegExp.hasMatch(value)) return 'email invalid';

            return null;
          },
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextFormField(
          label: 'Password',
          obscureText: true,
          onChanged: registerCubit.passwordChanged,
          errorMessage: password.errorMessage,
        ),
        const SizedBox(
          height: 20,
        ),
        FilledButton.tonalIcon(
            onPressed: () {
              registerCubit.onSubmit();
            },
            icon: const Icon(Icons.save),
            label: const Text('Create User')),
      ],
    ));
  }
}
