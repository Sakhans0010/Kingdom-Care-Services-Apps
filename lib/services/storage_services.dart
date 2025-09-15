import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  // Singleton
  static final SecureStorageService _instance =
      SecureStorageService._internal();
  factory SecureStorageService() => _instance;
  SecureStorageService._internal();

  // FlutterSecureStorage instance
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  // ------------------ WRITE ------------------
  Future<void> write({required String key, required String value}) async {
    try {
      await _storage.write(key: key, value: value);
    } catch (e) {
      throw Exception("Failed to write to secure storage: $e");
    }
  }

  // ------------------ READ ------------------
  Future<String?> read({required String key}) async {
    try {
      return await _storage.read(key: key);
    } catch (e) {
      throw Exception("Failed to read from secure storage: $e");
    }
  }

  // ------------------ DELETE ------------------
  Future<void> delete({required String key}) async {
    try {
      await _storage.delete(key: key);
    } catch (e) {
      throw Exception("Failed to delete from secure storage: $e");
    }
  }

  // ------------------ READ ALL ------------------
  Future<Map<String, String>> readAll() async {
    try {
      return await _storage.readAll();
    } catch (e) {
      throw Exception("Failed to read all from secure storage: $e");
    }
  }

  // ------------------ DELETE ALL ------------------
  Future<void> deleteAll() async {
    try {
      await _storage.deleteAll();
    } catch (e) {
      throw Exception("Failed to delete all from secure storage: $e");
    }
  }
}
