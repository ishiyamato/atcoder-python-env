FROM python:3.8

RUN apt-get update \
    && apt-get -y install --no-install-recommends apt-utils dialog 2>&1 \
    && apt-get -y install git iproute2 procps lsb-release curl

RUN pip3.8 install markupsafe==2.0.1
RUN pip3.8 install atcoder-tools

RUN mkdir -p /root/.atcodertools/template 
RUN mkdir -p /root/atcoder-workspace

RUN echo 'asub="atcoder-tools submit -f -u"'
RUN echo 'alias atest="atcoder-tools test"' >> /root/.bashrc

RUN echo 'alias agen="atcoder-tools gen --without-login --template /root/.atcodertools/template/template.py --lang=python"' >> /root/.bashrc
RUN echo 'alias agenlogin="atcoder-tools gen --template /root/.atcodertools/template/template.py --lang=python"' >> /root/.bashrc
RUN echo 'alias asub="atcoder-tools submit -u"' >> /root/.bashrc

RUN curl -s -S https://raw.githubusercontent.com/ishiyamato/atcoder-python-env/c6fd9a64e82f5184916484b142bbb508acab31c4/template.py >> /root/.atcodertools/template/template.py
# RUN curl -s -S https://raw.githubusercontent.com/ishiyamato/AtCoder/51dd7fb363c7f40956f40686feabf28a347505f4/algorithm.py >> /root/atcoder-workspace/algorighm.py
CMD ["/bin/bash"]
