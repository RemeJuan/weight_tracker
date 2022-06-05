class UriBuilder {
  const UriBuilder();

  Uri uri(String path, {Map<String, dynamic>? queryParameters}) {
    return Uri(
      scheme: 'http',
      host: const String.fromEnvironment('API'),
      path: "api/$path",
      queryParameters: queryParameters,
    );
  }
}
