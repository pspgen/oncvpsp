FROM psp00:latest

WORKDIR /build
# compile oncvpsp-4.0.1
RUN wget -c http://www.mat-simresearch.com/oncvpsp-4.0.1.tar.gz && \
    tar xf oncvpsp-4.0.1.tar.gz
RUN cd oncvpsp-4.0.1/src && make all && \
    cp oncvpsp.x /usr/bin/oncvpsp4.x && \
    cp oncvpspnr.x /usr/bin/oncvpspnr4.x && \
    cp oncvpspr.x /usr/bin/oncvpspr4.x
RUN rm /build
