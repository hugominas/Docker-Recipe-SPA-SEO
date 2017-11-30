# specify the node base image with your desired version node:<version>
FROM node:latest


MAINTAINER Hugo Rodrigues "hugo@cors.digital"


EXPOSE 8888


ENV HOME /root
ENV APP_HOME /application/
ENV NODE_ENV production

# RUN echo deb http://ftp.debian.org/debian/ jessie main contrib non-free > /etc/apt/source.list

# RUN apt-get update -y && apt-get install -y \
#     python2.7 python-pip \
#     libfreetype6 libfontconfig

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
  && sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
  && apt-get update -y \
  && apt-get install google-chrome-stable -y

RUN git clone https://github.com/hugominas/Recipe_SPA_SEO.git /application

WORKDIR $APP_HOME

RUN npm install

CMD ["node", "server.js"]
