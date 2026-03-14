import 'package:flutter/material.dart';
import 'package:frontend/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:frontend/utils/constants.dart';
import 'package:frontend/widgets/common/appointment_button.dart';
import 'package:frontend/widgets/common/section_header.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPassController = TextEditingController();

  bool _obsecurePassword = true;
  bool _obsecureConfirmPass = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 150),
      child: Column(
        children: [
          SectionHeader(
            title: 'Create an Account',
            subtitle:
                'Signup to access personalized therapy and mental health tools.',
          ),
          const SizedBox(height: 30),
          Form(
            key: _formKey,
            child: Column(
              children: [
                // Name field
                _buildTextField(
                  controller: _nameController,
                  label: "Full Name",
                  prefixIcon: Icons.person_outline,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required';
                    }
                    if (value.split(' ').length < 2) {
                      return 'Full name Required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 14),

                // email field
                _buildTextField(
                  controller: _emailController,
                  label: 'Email',
                  prefixIcon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
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

                // password field
                _buildTextField(
                  controller: _passwordController,
                  obsecureText: _obsecurePassword,
                  prefixIcon: Icons.lock_outline,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _obsecurePassword = !_obsecurePassword;
                      });
                    },
                    icon: Icon(
                      _obsecurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    color: Colors.grey[600],
                  ),
                  label: 'Password',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 14),

                // confirm password field
                _buildTextField(
                  controller: _confirmPassController,
                  obsecureText: _obsecureConfirmPass,
                  prefixIcon: Icons.lock_outline,
                  label: 'Confirm Password',
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _obsecureConfirmPass = !_obsecureConfirmPass;
                      });
                    },
                    icon: Icon(
                      _obsecureConfirmPass
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    color: Colors.grey[600],
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required';
                    }
                    if (value != _passwordController.text) {
                      return 'Passwords needs to match';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 14),
                const Text('I Agree to the Terms & Conditions.'),
                const SizedBox(height: 24),

                // SizedBox(
                //   width: double.infinity,
                //   height: 56,
                //   child: AppointmentButton(
                //     text: 'Register',
                //     onPressed: _submitForm,
                //   ),
                // ),
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
                      width: double.infinity,
                      height: 56,
                      child: AppointmentButton(
                        text: 'Register',
                        onPressed: _submitForm,
                      ),
                    );
                  },
                ),

                // const SizedBox(height: 8),
                TextButton(
                  onPressed: () {
                    // go back to login
                    Navigator.pop(context);
                    // Navigator.pushNamed(context, '/login');
                  },
                  child: const Text('Already have an account? Login'),
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
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      bool success;

      success = await authProvider.register(
        email: _emailController.text.trim(),
        password: _passwordController.text,
        name: _nameController.text,
      );

      if (success && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('User Registered Succesfully!'),
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
      //   "name": _nameController.text,
      //   "email": _emailController.text,
      //   "password": _passwordController.text,
      // };

      // print('user Data: $userData');

      // clear form
      _nameController.clear();
      _emailController.clear();
      _passwordController.clear();
      _confirmPassController.clear();
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPassController.dispose();
    super.dispose();
  }
}
