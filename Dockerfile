FROM alpine:3.5
#RUN apk add --no-cache --update python py-pip
RUN echo "**** install Python ****" && \
    apk add --no-cache python3 && \
    if [ ! -e /usr/bin/python ]; then ln -sf python3 /usr/bin/python ; fi && \
    \
    echo "**** install pip ****" && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --no-cache --upgrade pip setuptools wheel && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi


COPY requirements.txt /src/requirements.txt
RUN pip install -r /src/requirements.txt
COPY webapp.py /src/webapp.py
COPY buzz /src/buzz
CMD python /src/webapp.py
