FROM  alpine
LABEL Author=wxdlong \
      Email=wxdlong@qq.com \
      WHAT="Temp download what you want."

COPY ok8s.tar.gz /home

ENTRYPOINT ["tar","-xzvf","/home/ok8s.tar.gz","-C","/ok8s"]

