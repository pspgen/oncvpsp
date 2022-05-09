FROM psp00:latest

# compile oncvpsp-4.0.1
RUN wget -c http://www.mat-simresearch.com/oncvpsp-4.0.1.tar.gz
RUN tar xf oncvpsp-4.0.1.tar.gz
RUN cd oncvpsp-4.0.1/src && make all && cp *.x /usr/bin
RUN mv /usr/bin/oncvpsp.x /usr/bin/oncvpsp4.x && \
    mv /usr/bin/oncvpspnr.x /usr/bin/oncvpspnr4.x && \
    mv /usr/bin/oncvpspr.x /usr/bin/oncvpspr4.x
RUN rm -rf oncvpsp-4.0.1
RUN ls -l /usr/bin/oncv*
