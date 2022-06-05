class UriBuilder {
  const UriBuilder();

  Uri uri(String path, {Map<String, dynamic>? queryParameters}) {
    return Uri(
      scheme: 'http',
      host: const String.fromEnvironment('API').split(":").first,
      port: int.parse(const String.fromEnvironment('API').split(":").last),
      path: "api/$path",
      queryParameters: queryParameters,
    );
  }
}
