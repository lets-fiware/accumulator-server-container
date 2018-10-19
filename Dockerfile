FROM centos
RUN yum update -y && \
    yum install -y epel-release && \
    yum install -y python-pip git && \
    pip install pyOpenSSL flask && \
    git clone --depth=1 https://github.com/telefonicaid/fiware-orion.git && \
    cp -a ./fiware-orion/scripts/accumulator-server.py / && \
    rm -fr ./fiware-orion && \
    yum remove -y python-pip git && \
    yum clean all
EXPOSE 1028
CMD /accumulator-server.py --port 1028 --url /accumulate --host 0.0.0.0 --pretty-print -v
