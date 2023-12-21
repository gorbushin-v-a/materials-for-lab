FROM alpine:latest

RUN apk add bash
RUN apk add py-pip
RUN apk add gcc musl-dev linux-headers python3-dev

RUN pip install --upgrade pip
RUN pip install virtualenv

RUN mkdir /var/jupyter
RUN mkdir /srv/jupyter

WORKDIR /srv/jupyter

RUN virtualenv jupyter
RUN source jupyter/bin/activate
RUN chmod +x jupyter/bin/activate

RUN pip install jupyter

ENTRYPOINT jupyter notebook --ip 0.0.0.0 --port 8080 --NotebookApp.notebook_dir = "/var/jupyter" --NotebookApp.token="" --NotebookApp.password="" --allow-root

EXPOSE 8080
