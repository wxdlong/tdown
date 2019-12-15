FROM  alpine
LABEL Author=wxdlong \
      Email=wxdlong@qq.com \
      WHAT="Temp download what you want."

COPY tdown.tar.gz /home

ENTRYPOINT ["tar","-xzvf","/home/otdown.tar.gz","-C","/tdown"]

