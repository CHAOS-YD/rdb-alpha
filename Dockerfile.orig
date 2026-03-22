FROM ubuntu:20.04

ARG USERNAME=camper
ARG HOMEDIR=/workspace/project

ENV TZ="America/New_York" \
    LOCALE=en_US.UTF-8

# Use USTC mirror for faster access (China region)
RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
    sed -i 's/security.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list

RUN apt update && apt install -y sudo
RUN yes | unminimize
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN adduser --disabled-password --gecos '' ${USERNAME}
RUN adduser ${USERNAME} sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER ${USERNAME}

RUN sudo apt install -y curl git postgresql postgresql-contrib nano bash-completion man-db
RUN sudo locale-gen ${LOCALE} && sudo update-locale LANG=${LOCALE}
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
RUN sudo apt install -y nodejs
RUN sudo mkdir /workspace
RUN sudo mkdir ${HOMEDIR}
RUN sudo chown -R ${USERNAME}:${USERNAME} ${HOMEDIR}

WORKDIR ${HOMEDIR}

ENV CODEROAD_DISABLE_RUN_ON_SAVE=true
# Do not change above this line.

# ===== Git configuration =====
# Set Git user info to avoid warnings and enable commit operations
RUN git config --global user.name "qdyangdi" && \
    git config --global user.email "936768863@qq.com" && \
    git config --global core.autocrlf input

# ===== PostgreSQL configuration =====
USER root
# Set all local and host authentication to trust (development environment)
RUN sed -i 's/^local\s\+all\s\+all\s\+peer/local all all trust/' /etc/postgresql/*/main/pg_hba.conf && \
    sed -i 's/^host\s\+all\s\+all\s\+127\.0\.0\.1\/32\s\+md5/host all all 127.0.0.1\/32 trust/' /etc/postgresql/*/main/pg_hba.conf && \
    sed -i 's/^host\s\+all\s\+all\s\+::1\/128\s\+md5/host all all ::1\/128 trust/' /etc/postgresql/*/main/pg_hba.conf && \
    sed -i 's/^local\s\+all\s\+postgres\s\+peer/local all postgres trust/' /etc/postgresql/*/main/pg_hba.conf

# Switch back to regular user
USER ${USERNAME}
