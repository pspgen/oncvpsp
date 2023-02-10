FROM pspgen/psp-prerequisites:0.1.0

WORKDIR /oncvpsp-build
# compile oncvpsp-4.0.1
RUN wget -c http://www.mat-simresearch.com/oncvpsp-4.0.1.tar.gz && \
    tar xf oncvpsp-4.0.1.tar.gz
RUN cd oncvpsp-4.0.1/src && \
    echo "LIBS += -static-libgfortran -static-libgcc" >> ../make.inc && \
    make all

FROM phusion/baseimage:focal-1.2.0
RUN apt-get update && apt-get install -y \
    libquadmath0 \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get clean all

COPY --from=0 /oncvpsp-build/oncvpsp-4.0.1/src/*.x /usr/local/bin/
