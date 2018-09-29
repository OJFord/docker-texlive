FROM alpine:latest as base

RUN wget 'http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz'
RUN tar -xf install-tl-*
RUN apk add perl wget
RUN cd install-tl-* && yes i | ./install-tl
RUN /usr/local/texlive/2*/bin/x86_64-linuxmusl/tlmgr update --all

FROM alpine:latest
MAINTAINER Oliver Ford <dev@ojford.com>

COPY --from=base /usr/local/texlive /usr/local/texlive
ENV PATH /usr/local/texlive/2*/bin/x86_64-linuxmusl:"$PATH"

ENTRYPOINT ["/bin/sh"]
