FROM alpine:edge

COPY install.sh entrypoint.sh /
RUN chmod +x /install.sh /entrypoint.sh
RUN /install.sh

COPY root/ /

EXPOSE 80
EXPOSE 8081
EXPOSE 3306
EXPOSE 9229

CMD ["/entrypoint.sh"]
