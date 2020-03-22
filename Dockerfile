FROM centos:centos7

RUN yum -y install epel-release && \
    yum -y update && \
    yum -y install \
        gawk \
        make \
        wget \
        tar \
        bzip2 \
        gzip \
        python \
        unzip \
        perl \
        patch \
        diffutils \
        diffstat \
        git \
        subversion \
        cpp \
        gcc \
        gcc-c++ \
        glibc-devel \
        texinfo \
        chrpath \
        socat \
        perl-Data-Dumper \
        perl-Text-ParseWords \
        perl-Thread-Queue \
        file \
        xz \
        sudo \
        which && \
    yum clean all && \
    rm -rf /var/cache/yum

RUN mkdir sdk && \
    cd sdk && \
    wget https://gorka.eguileor.com/files/sdk.tar.bz2 && \
    tar xf sdk.tar.bz2 && \
    chmod +x fsl-imx-fb-glibc-x86_64-core-image-minimal-cortexa7hf-neon-toolchain-4.9.88-2.0.0.sh && \
    ./fsl-imx-fb-glibc-x86_64-core-image-minimal-cortexa7hf-neon-toolchain-4.9.88-2.0.0.sh -y -d /opt/sdk && \
    rm -rf sdk && \
    groupadd -g 1000 sdk && \
    useradd -u 1000 -g sdk -m sdk

COPY sdk /usr/local/bin

USER sdk
WORKDIR /home/sdk
ENTRYPOINT ["/usr/local/bin/run-sourced.sh"]
CMD ["/bin/bash"]
