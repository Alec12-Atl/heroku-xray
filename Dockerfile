FROM alpine

ENV CONFIG=https://raw.githubusercontent.com/yuchen198/heroku-xray/config.json

#https://raw.githubusercontent.com/yuchen198/heroku-xray/master/xray.json

RUN apk update && apk --no-cache add ca-certificates unzip && \
    wget -c https://github.com/XTLS/Xray-core/releases/download/v1.0.0/Xray-linux-64.zip && \
    unzip Xray-linux-64.zip && rm -f Xray-linux-64.zip && \
    chmod 700 xray
    
CMD ./xray -config $CONFIG
