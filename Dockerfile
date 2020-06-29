FROM node:12.18.1

RUN apt-get update && \
  apt-get install -y xvfb x11-xkb-utils xfonts-100dpi xfonts-75dpi \
  xfonts-scalable xfonts-cyrillic x11-apps clang libdbus-1-dev libgtk2.0-dev \
  libnotify-dev libgnome-keyring-dev libgconf2-dev libasound2-dev libcap-dev \
  libcups2-dev libxtst-dev libxss1 libnss3-dev gcc-multilib g++-multilib

# Copied from https://hub.docker.com/r/electronuserland/electron-builder/dockerfile
RUN curl -L https://yarnpkg.com/latest.tar.gz | tar xvz && mv yarn-* /yarn && \
  apt-get update -y && apt-get install --no-install-recommends -y software-properties-common && \
  add-apt-repository ppa:snappy-dev/tools && apt-get update -y && apt-get upgrade -y && \
  apt-get install --no-install-recommends -y google-chrome-stable libsecret-1-0 locales xvfb git snapcraft qtbase5-dev xorriso bsdtar build-essential autoconf libssl-dev icnsutils libopenjp2-7 graphicsmagick lzip rpm yasm libcurl3 && \
  curl -O http://mirrors.kernel.org/ubuntu/pool/universe/libi/libicns/libicns1_0.8.1-3.1_amd64.deb && dpkg --install libicns1_0.8.1-3.1_amd64.deb && unlink libicns1_0.8.1-3.1_amd64.deb && \
  apt-get remove software-properties-common -y && \
  apt-get clean && rm -rf /var/lib/apt/lists/*

# Fixes "cannot run in wd" issue with some Lerna versions https://github.com/theia-ide/theia/issues/508
RUN npm config set unsafe-perm true

# Needed for yoman run in Docker
RUN mkdir -p /root/.config/configstore && chmod g+rwx /root /root/.config /root/.config/configstore