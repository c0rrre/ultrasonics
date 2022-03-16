FROM python:3.8.5-alpine

COPY . /
WORKDIR /

VOLUME [ "/config", "/plugins" ]

RUN apk --no-cache add gcc g++ musl-dev git
RUN pip install -r requirements.txt

# clone tidal git repo
RUN git clone -b 0.7.x https://github.com/tamland/python-tidal.git
RUN cd python-tidal
RUN python3 setup.py install

EXPOSE 5000

ENTRYPOINT ["python"]

CMD ["app.py"]
