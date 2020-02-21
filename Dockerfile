FROM python:2.7-stretch

RUN apt-get update && \
    apt-get install -y git && \
    pip install --no-cache-dir flask==1.0.2 pyOpenSSL && \
    git clone --depth=1 https://github.com/telefonicaid/fiware-orion.git && \
    cp -p ./fiware-orion/scripts/accumulator-server.py / && \
    apt-get remove -y git && \
    rm -fr ./fiware-orion /var/lib/apt/lists/*

EXPOSE 1028

CMD /accumulator-server.py --port 1028 --url /accumulate --host 0.0.0.0 --pretty-print -v

