FROM debian:12.7

LABEL project="linuxtips-giropops-senhas"
LABEL author="Helber Maciel Guerra <helbermg@gmail.com>"

RUN apt-get -y update && \
  apt-get install -y --no-install-recommends pip

WORKDIR /app

ADD . /app/

RUN pip install --no-cache-dir --break-system-packages -r /app/requirements.txt
EXPOSE 5000

CMD [ "run", "--host=0.0.0.0" ]
ENTRYPOINT [ "flask" ]
