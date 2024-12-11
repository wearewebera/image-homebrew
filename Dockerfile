FROM webera/base

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install -y apt-utils \
  && apt-get dist-upgrade -y  \
  && apt-get install -y \ 
    build-essential \
    procps \
    locales \
    curl \
    file \
    git \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN localedef -i en_US -f UTF-8 en_US.UTF-8

RUN useradd -m -s /bin/bash linuxbrew && \
    echo 'brew ALL=(ALL) NOPASSWD:ALL' >>/etc/sudoers

USER linuxbrew
RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

USER root
ENV PATH="/home/linuxbrew/.linuxbrew/bin:${PATH}"

