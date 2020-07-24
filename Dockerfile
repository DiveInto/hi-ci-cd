FROM tutum/curl:alpine

WORKDIR /workdir

COPY file1 .

RUN cat file1
RUN echo hello-world
RUN pwd
RUN curl https://baidu.com