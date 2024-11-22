FROM alpine:3.20 as builder
RUN apk add --no-cache build-base
ADD endlessh.c Makefile /
RUN make

FROM alpine:3.20
EXPOSE 2222/tcp
ENTRYPOINT ["/endlessh"]
CMD ["-v"]
COPY --from=builder /endlessh /
COPY util/docker/endlessh.conf /etc/endlessh/config
