FROM node:12.18.1

RUN apt-get update -y

RUN apt-get install -y xfonts-100dpi xfonts-75dpi xfonts-scalable xfonts-cyrillic
RUN apt-get install -y xvfb

# Chrome deps. See https://github.com/GoogleChrome/puppeteer/blob/master/docs/troubleshooting.md
RUN apt-get install -y ca-certificates \
      fonts-liberation \
      gconf-service \
      libappindicator1 \
      libasound2 \
      libatk-bridge2.0-0 \
      libatk1.0-0 \
      libc6 \
      libcairo2 \
      libcups2 \
      libdbus-1-3 \
      libexpat1 \
      libfontconfig1 \
      libgbm1 \
      libgcc1 \
      libgconf-2-4 \
      libgdk-pixbuf2.0-0 \
      libglib2.0-0 \
      libgtk-3-0 \
      libnspr4 \
      libnss3 \
      libpango-1.0-0 \
      libpangocairo-1.0-0 \
      libstdc++6 \
      libx11-6 \
      libx11-xcb1 \
      libxcb1 \
      libxcomposite1 \
      libxcursor1 \
      libxdamage1 \
      libxext6 \
      libxfixes3 \
      libxi6 \
      libxrandr2 \
      libxrender1 \
      libxss1 \
      libxtst6 \
      lsb-release \
      wget \
      xdg-utils

# Fixes "cannot run in wd" issue with some Lerna versions https://github.com/theia-ide/theia/issues/508
RUN npm config set unsafe-perm true

# Needed for yoman run in Docker
RUN mkdir -p /root/.config/configstore && chmod g+rwx /root /root/.config /root/.config/configstore