FROM ubuntu:16.04

ENV email example@secura.com
ENV password p
ENV username example
ENV host 127.0.0.1
ENV port 5000


RUN \
    cd / && \
	apt-get update && \
    apt-get purge -y python.* && \
    apt-get install -y build-essential && \
    apt-get install -y software-properties-common && \
	apt-get install -y git && \
	apt-get install -y python python-dev python-pip python-virtualenv && \
	apt-get install -y libjpeg-dev libz-dev python-dev libffi-dev libssl-dev libxslt1-dev libpng-dev libfreetype6-dev && \
	apt-get install -y curl wget && \
	apt-get install -y libfreetype6-dev libxft-dev libxml2-dev libxslt1-dev zlib1g-dev libpq-dev && \
	git clone https://github.com/privacyidea/privacyidea.git && \
    cd privacyidea && \
	pip install -r requirements.txt && \
	cd / && \
	rm -rf /var/lib/apt/lists/*

ADD start.bash /

EXPOSE 5000

CMD ["bash", "/start.bash"]