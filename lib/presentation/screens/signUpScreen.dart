
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  static String routeName = 'Login';
  static String routePath = 'login';

  @override
  State<SignInPage> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<SignInPage> with TickerProviderStateMixin {
  late LoginModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();



  @override
  void initState() {
    super.initState();
    _model = LoginModel();

    _model.emailAddressTextController ??= TextEditingController();
    _model.emailAddressFocusNode ??= FocusNode();

    _model.passwordTextController ??= TextEditingController();
    _model.passwordFocusNode ??= FocusNode();


  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).scaffoldBackgroundColor,
                Theme.of(context).primaryColor,
              ],
              stops: [0.3, 1.0],
              begin: AlignmentDirectional(1.0, -1.0),
              end: AlignmentDirectional(-1.0, 1.0),
            ),
          ),
          alignment: AlignmentDirectional(0, 0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  constraints: BoxConstraints(
                    maxWidth: 530,
                  ),
                  decoration: BoxDecoration(),
                  child: Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                if (Theme.of(context).brightness == Brightness.light)
                                  Image.asset(
                                    'assets/images/logo_newforceLight_alt@3x.png',
                                    width: 170,
                                    height: 60,
                                    fit: BoxFit.fitWidth,
                                  ),
                                if (Theme.of(context).brightness == Brightness.dark)
                                  Image.asset(
                                    'assets/images/logo_newforceDark_alt@3x.png',
                                    width: 170,
                                    height: 60,
                                    fit: BoxFit.fitWidth,
                                  ),
                              ],
                            ),
                          ),
                          Text(
                            'Welcome Back!',
                            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                              letterSpacing: 0.0,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              'Use the form below to access your account.',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                letterSpacing: 0.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                                    child: TextFormField(
                                      controller: _model.emailAddressTextController,
                                      focusNode: _model.emailAddressFocusNode,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Email Address',
                                        labelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                                          letterSpacing: 0.0,
                                        ),
                                        hintText: 'Enter your email here...',
                                        hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                                          letterSpacing: 0.0,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Theme.of(context).dividerColor,
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.circular(40),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.circular(40),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.circular(40),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.circular(40),
                                        ),
                                        filled: true,
                                        fillColor: Theme.of(context).secondaryHeaderColor,
                                        contentPadding: EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
                                      ),
                                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: _model.passwordTextController,
                                    focusNode: _model.passwordFocusNode,
                                    obscureText: !_model.passwordVisibility,
                                    decoration: InputDecoration(
                                      labelText: 'Password',
                                      labelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                                        letterSpacing: 0.0,
                                      ),
                                      hintText: 'Enter your password here...',
                                      hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                                        letterSpacing: 0.0,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Theme.of(context).dividerColor,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      filled: true,
                                      fillColor: Theme.of(context).secondaryHeaderColor,
                                      contentPadding: EdgeInsetsDirectional.fromSTEB(16, 24, 24, 24),
                                      suffixIcon: InkWell(
                                        onTap: () => setState(
                                              () => _model.passwordVisibility = !_model.passwordVisibility,
                                        ),
                                        focusNode: FocusNode(skipTraversal: true),
                                        child: Icon(
                                          _model.passwordVisibility
                                              ? Icons.visibility_outlined
                                              : Icons.visibility_off_outlined,
                                          color: Color(0xFF57636C),
                                          size: 22,
                                        ),
                                      ),
                                    ),
                                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      letterSpacing: 0.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    // context.pushNamed('ForgotPassword');
                                  },
                                  child: Text(
                                    'Forgot Password?',
                                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      letterSpacing: 0.0,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () async {
                                    // Auth logic here
                                  },
                                  child: Text(
                                    'Login',
                                    style: GoogleFonts.outfit(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(130, 50),
                                    backgroundColor: Theme.of(context).primaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 12),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Use a social platform to continue',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    letterSpacing: 0.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: InkWell(
                                    onTap: () async {
                                      // Google sign in logic
                                    },
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).dividerColor,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 5,
                                            color: Color(0x3314181B),
                                            offset: Offset(0.0, 2),
                                          )
                                        ],
                                        shape: BoxShape.circle,
                                      ),
                                      alignment: AlignmentDirectional(0, 0),
                                      child: FaIcon(
                                        FontAwesomeIcons.google,
                                        color: Theme.of(context).textTheme.bodyLarge?.color,
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: InkWell(
                                    onTap: () async {
                                      // Apple sign in logic
                                    },
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).dividerColor,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 5,
                                            color: Color(0x3314181B),
                                            offset: Offset(0.0, 2),
                                          )
                                        ],
                                        shape: BoxShape.circle,
                                      ),
                                      alignment: AlignmentDirectional(0, 0),
                                      child: FaIcon(
                                        FontAwesomeIcons.apple,
                                        color: Theme.of(context).textTheme.bodyLarge?.color,
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 24),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Don\'t have an account?',
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    letterSpacing: 0.0,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    // context.pushNamed('CreateAccount');
                                  },
                                  child: Text(
                                    'Create Account',
                                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginModel {
  TextEditingController? emailAddressTextController;
  FocusNode? emailAddressFocusNode;
  TextEditingController? passwordTextController;
  FocusNode? passwordFocusNode;
  bool passwordVisibility = false;

  void dispose() {
    emailAddressTextController?.dispose();
    emailAddressFocusNode?.dispose();
    passwordTextController?.dispose();
    passwordFocusNode?.dispose();
  }
}