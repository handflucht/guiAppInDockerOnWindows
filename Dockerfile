FROM ubuntu

RUN apt-get update \
    && apt-get install -y firefox

CMD /usr/bin/firefox
