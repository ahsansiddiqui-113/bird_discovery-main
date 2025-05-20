import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthController extends GetxController {
  RxBool isPasswordObsecure = true.obs;
  RxBool isConfirmPasswordObsecure = false.obs;
  RxBool isRememberMe = false.obs;
  RxBool isLoading = false.obs;

  final _secureStorage = const FlutterSecureStorage();
  final String baseUrl = 'http://192.168.10.4:8000/api/v2';

  Future<bool> signUpUser(String email, String name, String password) async {
    isLoading.value = true;
    try {
      final url = Uri.parse('$baseUrl/signup/');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email.trim(),
          'name': name.trim(),
          'password': password.trim(),
        }),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 201 && data.containsKey('access')) {
        await _storeTokens(data);
        return true;
      } else {
        final error = data['error'] ?? data['detail'] ?? 'Signup failed';
        Get.snackbar('Signup Failed', error);
        return false;
      }
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong');
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> loginUser(String email, String password) async {
    isLoading.value = true;
    try {
      final url = Uri.parse('$baseUrl/login/');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 && data.containsKey('access')) {
        await _storeTokens(data);
        return true;
      } else {
        final error = data['error'] ?? data['detail'] ?? 'Login failed';
        Get.snackbar('Login Failed', error);
        return false;
      }
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong');
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> googleSignUp() async {
    final googleUser = await GoogleSignIn().signIn();
    final googleAuth = await googleUser?.authentication;

    if (googleAuth != null) {
      final idToken = googleAuth.idToken;
      final response = await http.post(
        Uri.parse('$baseUrl/google-signup/'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'id_token': idToken}),
      );

      final data = jsonDecode(response.body);
      if (response.statusCode == 200 && data.containsKey('access')) {
        await _storeTokens(data);
        Get.snackbar('Success', 'Google signup successful');
      } else {
        Get.snackbar('Error', 'Google signup failed');
      }
    }
  }

  Future<void> appleSignUp() async {
    final credential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );

    final response = await http.post(
      Uri.parse('$baseUrl/apple-signup/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'identity_token': credential.identityToken}),
    );

    final data = jsonDecode(response.body);
    if (response.statusCode == 200 && data.containsKey('access')) {
      await _storeTokens(data);
      Get.snackbar('Success', 'Apple signup successful');
    } else {
      Get.snackbar('Error', 'Apple signup failed');
    }
  }

  Future<void> _storeTokens(Map<String, dynamic> data) async {
    await _secureStorage.write(key: 'access_token', value: data['access']);
    await _secureStorage.write(key: 'refresh_token', value: data['refresh']);
  }

  bool validateSignup(String name, String email, String password) {
    if (name.isEmpty || !RegExp(r"^[a-zA-Z\s]+").hasMatch(name)) {
      Get.snackbar('Error', 'Enter a valid name');
      return false;
    }
    if (email.isEmpty || !RegExp(r"^[\w\.-]+@[\w\.-]+\.\w+").hasMatch(email)) {
      Get.snackbar('Error', 'Enter a valid email');
      return false;
    }
    if (password.isEmpty || password.length < 6) {
      Get.snackbar('Error', 'Password must be at least 6 characters');
      return false;
    }
    return true;
  }

  bool validateSignin(String email, String password) {
    if (email.isEmpty || !RegExp(r"^[\w\.-]+@[\w\.-]+\.\w+").hasMatch(email)) {
      Get.snackbar('Error', 'Enter a valid email');
      return false;
    }
    if (password.isEmpty) {
      Get.snackbar('Error', 'Password is required');
      return false;
    }
    return true;
  }

  void togglePasswordVisibility() =>
      isPasswordObsecure.value = !isPasswordObsecure.value;
  void toggleConfirmPasswordVisibility() =>
      isConfirmPasswordObsecure.value = !isConfirmPasswordObsecure.value;
  void toggleCheckboxRemeber() => isRememberMe.value = !isRememberMe.value;
}
