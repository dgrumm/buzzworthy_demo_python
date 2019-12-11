FROM alpine:3.5
RUN apk add --no-cache --update python3
COPY requirements.txt /src/requirements.txt
RUN pip install -r /src/requirements.txt
COPY webapp.py /src/webapp.py
COPY buzz /src/buzz
CMD python /src/webapp.py
