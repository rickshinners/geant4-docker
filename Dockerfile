FROM ubuntu:16.04
ARG GEANT4_VERSION=10.04
RUN apt-get update && apt-get install -y \
    cmake \
    build-essential \
    libclhep-dev \
    libexpat1-dev \
    zlibc \
    libxerces-c-dev
COPY files/geant4.${GEANT4_VERSION}.tar.gz /geant4.${GEANT4_VERSION}.tar
RUN tar -xf /geant4.${GEANT4_VERSION}.tar && \
    rm /geant4.${GEANT4_VERSION}.tar && \
    mkdir /geant4.${GEANT4_VERSION}-build && \
    cd /geant4.${GEANT4_VERSION}-build && \
    cmake -DCMAKE_INSTALL_PREFIX=/geant4.${GEANT4_VERSION}-install /geant4.${GEANT4_VERSION} && \
    make -j4 && \
    make install
RUN rm -rf \
    /geant4.${GEANT4_VERSION} \
    /geant4.${GEANT4_VERSION}-build

CMD [ "/bin/bash" ]
