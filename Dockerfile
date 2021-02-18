FROM debian:buster

RUN apt-get update && \
    apt-get install -y \
    curl unzip \
    && rm -rf /var/lib/apt/lists/*

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip \
    && rm awscliv2.zip
RUN ./aws/install

ADD run.sh /
RUN chmod +x /run.sh

ENTRYPOINT ["sh", "/run.sh"]
CMD ["start"]
