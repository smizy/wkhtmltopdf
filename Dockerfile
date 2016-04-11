FROM centos:7
MAINTAINER smizy

RUN set -x \
    && yum install -y \
        libXext \
        libXrender \
        ipa-pgothic-fonts \ 
        xorg-x11-fonts-75dpi \
        xorg-x11-fonts-Type1 \    
    && yum clean all \ 
    && mkdir -p /code /root/.fonts \
    && curl -sSL http://download.gna.org/wkhtmltopdf/0.12/0.12.3/wkhtmltox-0.12.3_linux-generic-amd64.tar.xz \
       | tar -xJf - -C /usr/local --strip-components=1 

ONBUILD COPY fonts /root/.fonts/

RUN fc-cache -fv

VOLUME ["/code"]
WORKDIR "/code"    
