import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/providers/auth_provider.dart';
import 'package:frontend/utils/constants.dart';
import 'package:frontend/widgets/common/appointment_button.dart';
import 'package:frontend/widgets/common/section_header.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState(); // will be back
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 36, vertical: 240),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SectionHeader(
            title: 'Welcome Back',
            subtitle: 'Login to manage your appointments and progress.',
          ),
          const SizedBox(height: 20),
          Form(
            key: _formKey,
            child: Column(
              children: [
                // Email field
                _buildTextField(
                  controller: _emailController,
                  label: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icons.email_outlined,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required';
                    }
                    if (!RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    ).hasMatch(value)) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 14),

                _buildTextField(
                  controller: _passwordController,
                  label: 'Password',
                  obsecureText: _obscurePassword,
                  prefixIcon: Icons.lock_outline,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 14),

                // SizedBox(
                //   height: 56,
                //   width: double.infinity,
                //   child: AppointmentButton(
                //     text: 'Login',
                //     onPressed: _submitForm,
                //   ),
                // ),

                // we can also use Provider.of() or Selector
                Consumer<AuthProvider>(
                  builder: (context, authProvider, child) {
                    if (authProvider.isLoading) {
                      return CircularProgressIndicator();
                    }

                    // show error if any
                    if (authProvider.error != null) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(authProvider.error!),
                            backgroundColor: Colors.red,
                          ),
                        );
                        authProvider.clearError();
                      });
                    }
                    return SizedBox(
                      height: 56,
                      width: double.infinity,
                      // child: ElevatedButton(
                      //   onPressed: () => _submitForm(context),
                      //   style: ElevatedButton.styleFrom(
                      //     minimumSize: const Size(double.infinity, 50),
                      //   ),
                      //   child: Text('Login'),
                      // ),
                      child: AppointmentButton(
                        text: 'Login',
                        onPressed: _submitForm,
                      ),
                    );
                  },
                ),

                // const SizedBox(height: 14),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: const Text("Don't have an account? Register"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    TextInputType? keyboardType,
    IconData? prefixIcon,
    Widget? suffixIcon,
    bool obsecureText = false,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obsecureText,
      maxLines: obsecureText ? 1 : maxLines,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey[600], fontSize: 14),
        floatingLabelStyle: const TextStyle(
          color: AppColors.primary,
          fontWeight: FontWeight.w600,
        ),
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: Colors.grey[600])
            : null,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey[100],
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.red[300]!, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.red[400]!, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      ),
    );
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      // gets the instance of AuthProvider from higher up in the widget tree, and listen false means i don't want to rebuild when provider change
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      // it's efficient to call methods (like login/logout)
      bool success;

      // because of the async operation the values might get disposed before login call (since it's async)
      // so we can store it BEFORE await
      final email = _emailController.text.trim();
      final password = _passwordController.text;

      success = await authProvider.login(email: email, password: password);

      // mounted tells widget is still in the tree, so it prevent disposed context -> CRASH!
      if (success && mounted) {
        // success snackbar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Login Successful!'),
            backgroundColor: AppColors.primary,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
        // Navigate
        Navigator.pushReplacementNamed(context, '/home');
      }

      // final userData = {
      //   "email": _emailController.text,
      //   "password": _passwordController.text,
      // };

      // print('user Data: $userData');

      // clear form
      _emailController.clear();
      _passwordController.clear();
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
