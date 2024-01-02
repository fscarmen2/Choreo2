FROM alpine

WORKDIR /home/choreouser

ADD files.tar.gz entrypoint.sh ./

RUN apk add --no-cache iproute2 vim netcat-openbsd &&\
    APP=$(tr -dc 'A-Za-z0-9' </dev/urandom | head -c 6) &&\
    mv x ${APP} &&\
    chmod -v 755 ${APP} entrypoint.sh &&\
    rm -f temp.zip &&\
    addgroup --gid 10001 choreo &&\
    adduser --disabled-password  --no-create-home --uid 10001 --ingroup choreo choreouser

ENTRYPOINT [ "./entrypoint.sh" ]

USER 10001
