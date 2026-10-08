import 'package:google_generative_ai/google_generative_ai.dart';

class AIService {
  // PASTE YOUR KEY HERE - Do NOT push this to public GitHub!
  static const String _apiKey = 'YOUR_API_KEY_HERE';

  late final GenerativeModel _model;

  AIService() {
    _model = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: _apiKey,
    );
  }

  Future<String> askAI(String prompt) async {
    try {
      final content = [Content.text(prompt)];
      final response = await _model.generateContent(content);
      return response.text ?? 'No response from AI';
    } catch (e) {
      return 'Error: $e';
    }
  }

  // For UniTrack - Smart Timetable / Study Assistant
  Future<String> getStudyHelp(String course, String topic) async {
    final prompt = 
      'You are UniTrack AI for UNIBEN students. Explain $topic for course $course in a simple way for a Nigerian university student. Keep it short and clear.';
    return await askAI(prompt);
  }

  // For CGPA advice
  Future<String> getCGPAAdvice(double currentCGPA, double targetCGPA) async {
    final prompt =
      'A UNIBEN student has CGPA $currentCGPA and wants $targetCGPA. Give 3 practical tips to improve.';
    return await askAI(prompt);
  }
}
