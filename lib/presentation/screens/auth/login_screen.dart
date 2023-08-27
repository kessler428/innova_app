import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:innova/bloc/auth/auth_bloc.dart';
import 'package:innova/config/theme/app_theme.dart';
import 'package:innova/presentation/widgets/loader_widget.dart';
import 'package:innova/utils/enums/request_progress_status.dart';

class LoginScreen extends StatelessWidget {

  static const path = '/login';
  static const pathName = 'login';

  LoginScreen({super.key});

  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.progressStatus == RequestProgressStatus.loading) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              const LoaderWidget().show(context);
            });
          }

          if (state.progressStatus == RequestProgressStatus.error) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              // Hide loading
              context.pop();

              // Show error
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Usuario o contraseña incorrectos'),
                  backgroundColor: AppTheme.secondaryColor,
                ),
              );

            
            });
          }
          if (state.progressStatus == RequestProgressStatus.success) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              // Hide loading
              context.pop();

              // Go to home
              context.go('/dashboard');

            });
          }
          if (state.progressStatus != RequestProgressStatus.nothing) {
            context.read<AuthBloc>().add(const ChangeProgressStatusEvent(progressStatus: RequestProgressStatus.nothing));
          }
        },
        child: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  height: MediaQuery.of(context).size.height,
                  child: Form(
                    key: _loginFormKey,
                    child: Column(
                      children: [
      
                        Container(
                          margin: const EdgeInsets.only(bottom: 60, top: 60),
                          child: Image.asset(
                            'lib/assets/images/logo.png',
                            width: 250,
                          ),
                        ),
      
                        BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                            return TextFormField(
                              initialValue: state.email,
                              decoration: const InputDecoration(labelText: 'Email'),
                              keyboardType: TextInputType.emailAddress,
                              inputFormatters: [
                                FilteringTextInputFormatter.deny(RegExp(r"(\s)"))
                              ],
                              onChanged: (value) {
                                if (EmailValidator.validate(value)) {
                                  context.read<AuthBloc>().add(AuthEmailChanged(email: value));
                                }
                              },
                              validator: (value) {
                                
                                if (value == null || value.isEmpty) {
                                  return 'El email es requerido';
                                }
                                if (!EmailValidator.validate(value)) {
                                  return 'El email no es válido';
                                }

                                return null;

                              },
                            );
                          },
                        ),
      
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          child: BlocBuilder<AuthBloc, AuthState>(
                            builder: (context, state) {
                              return TextFormField(
                                initialValue: state.password,
                                obscureText: true,
                                decoration: const InputDecoration(labelText: 'Password'),
                                onChanged: (value) {
                                  context.read<AuthBloc>().add(AuthPasswordChanged(password: value));
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'La contraseña es requerida';
                                  }
                                  return null;
                                },
                              );
                            },
                          ),
                        ),

                        Container(
                          alignment: Alignment.centerRight,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: TextButton(
                            onPressed: () {},
                            child: const Text('¿Olvidaste tu contraseña?'),
                          )
                        ),
                
                        MaterialButton(
                          onPressed: () {
                            if (_loginFormKey.currentState!.validate()) {
                              context.read<AuthBloc>().add(AuthLogin());
                            }
                          },
                          minWidth: double.infinity,
                          color: AppTheme.primaryColor,
                          textColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: ShapeBorder.lerp(
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            1
                          ),
                          child: const Text('Login'),
                        ),

                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          child: TextButton(
                            onPressed: () {},
                            child: const Text('¿No tienes cuenta? Registrate'),
                          )
                        ),
                  
                      ],
                    ),
                  ),
                ),
              ),
            ),
      ),
    );
  }
}