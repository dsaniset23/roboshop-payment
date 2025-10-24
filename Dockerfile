FROM        redhat/ubi9
RUN         dnf install python3 gcc python3-devel -y
WORKDIR     /app
RUN         useradd -d /app roboshop && chown roboshop:roboshop /app
COPY        . /app
USER        roboshop
RUN         pip3 install -r requirements.txt
CMD         ["uwsgi", "--ini",  "payment.ini"]