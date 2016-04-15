FROM centos:7
MAINTAINER smizy

ENV WKHTMLTOPDF_VERSION  0.12.3
ENV TWEMOJI_FONT_VERESION 1.0-beta1

RUN set -x \
    && yum install -y \
        libXext \
        libXrender \
        unzip \
        # ipa-pgothic-fonts \ 
        # vlgothic-fonts \
        # vlgothic-p-fonts \
        xorg-x11-fonts-75dpi \
        xorg-x11-fonts-Type1 \    
    && yum clean all \ 
    && mkdir -p \
        /code \
        /root/.fonts \
        /root/.config/fontconfig \
        /tmp/noto \
        /tmp/twemoji \
    && curl -sSL http://download.gna.org/wkhtmltopdf/0.12/${WKHTMLTOPDF_VERSION}/wkhtmltox-${WKHTMLTOPDF_VERSION}_linux-generic-amd64.tar.xz \
        | tar -xJf - -C /usr/local --strip-components=1 \
    && curl -sSL -o /tmp/noto/noto_sans.zip https://noto-website-2.storage.googleapis.com/pkgs/NotoSansCJKjp-hinted.zip \
    && curl -sSL -o /tmp/twemoji/twemoji.zip https://github.com/eosrei/twemoji-color-font/releases/download/v${TWEMOJI_FONT_VERESION}/TwitterColorEmoji-SVGinOT-Linux-${TWEMOJI_FONT_VERESION}.zip \
    && cd /tmp/noto \
    && unzip -o noto_sans.zip \
    && mv *.otf /root/.fonts/ \
    && cd /tmp/twemoji \
    && unzip -o twemoji.zip \
    && mv *.ttf /root/.fonts/ \
    && rm -rf /tmp/noto /tmp/twemoji

# COPY fonts /root/.fonts/
COPY fonts.conf /root/.config/fontconfig

RUN fc-cache -fv \
    && fc-match

VOLUME ["/code"]
WORKDIR "/code"    
