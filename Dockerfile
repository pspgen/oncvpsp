FROM pspgen/psp-prerequisites:0.1.0

WORKDIR /build
# compile oncvpsp-4.0.1
RUN wget -c http://www.mat-simresearch.com/oncvpsp-4.0.1.tar.gz && \
    tar xf oncvpsp-4.0.1.tar.gz
RUN cd oncvpsp-4.0.1/src && make all && \
    cp oncvpsp.x /usr/bin/oncvpsp4.x && \
    cp oncvpspnr.x /usr/bin/oncvpspnr4.x && \
    cp oncvpspr.x /usr/bin/oncvpspr4.x && \
    ln -s /usr/bin/oncvpsp4.x /usr/bin/oncvpsp.x && \
    ln -s /usr/bin/oncvpspnr4.x /usr/bin/oncvpspnr.x && \
    ln -s /usr/bin/oncvpspr4.x /usr/bin/oncvpspr.x

WORKDIR /
RUN rm -rf /build
