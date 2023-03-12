class AppConst {
  const AppConst._();

  static const String openAIApiKey = String.fromEnvironment('OPENAI_API_KEY');
  static const String openAIApiBaseUrl = 'https://api.openai.com/v1/chat';
}
