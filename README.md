# dart-web-app


Run locally:

dart bin/server.dart

Run through docker:

docker run -p 8080:8080 my_web_app

Above command binds to ipv6 address by default. Temporarily work around the issue by changing the below line in server.dart

HttpServer.bind(host, port); to

HttpServer.bind(InternetAddress.anyIPv4, port);

