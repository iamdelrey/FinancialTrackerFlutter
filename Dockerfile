FROM ubuntu:20.04

WORKDIR /app

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
    curl \
    git \
    unzip \
    xz-utils \
    zip \
    libglu1-mesa

RUN git clone https://github.com/flutter/flutter.git -b stable /flutter

ENV PATH="/flutter/bin:/flutter/bin/cache/dart-sdk/bin:${PATH}"

RUN echo "Hello, Flutter!" > /app/hello.txt
RUN echo "This is a test file for Flutter." > /app/test.txt

RUN echo '#!/bin/bash' > /app/start.sh && \
    echo 'echo "Docker build successful with Flutter!"' >> /app/start.sh && \
    chmod +x /app/start.sh

CMD ["/app/start.sh"]