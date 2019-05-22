FROM bitnami/minideb:latest
RUN apt-get update -y
RUN apt-get install wget unzip -y
RUN mkdir /temp \
    && wget http://iobin.suspended-chord.info/linux/iobin-linux-x64-deb-current.zip --directory-prefix /temp \
    && unzip /temp/iobin-linux-x64-deb-current.zip -d /temp \
    && dpkg -i /temp/IoLanguage-*.deb