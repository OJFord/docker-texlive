FROM alpine:latest as base

RUN wget 'http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz'
RUN tar -xf install-tl-*
RUN apk add perl wget
RUN cd install-tl-* && yes i | ./install-tl

FROM alpine:latest
MAINTAINER Oliver Ford <dev@ojford.com>

COPY --from=base /usr/local/texlive /usr/local/
ENV PATH "/usr/local/texlive/2018/bin/x86_64-linux:$PATH"

ENTRYPOINT ["/bin/sh"]
