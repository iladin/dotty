FROM codenvy/codenvy/codenvy/ubuntu_jdk8_x11

RUN apt-get update -y \
    && apt-get install -y zsh \
	&& rm -rf /var/lib/apt/lists/* \
	&& chsh -s /usr/bin/zsh

ENV SHELL /usr/bin/zsh

WORKDIR /root
ENTRYPOINT /usr/bin/zsh
