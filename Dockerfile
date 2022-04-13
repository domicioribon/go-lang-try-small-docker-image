FROM golang:1.18 as builder

WORKDIR /usr/src/app

COPY app /usr/src/app/ 
RUN go build main.go

FROM hello-world:linux
WORKDIR /home
COPY --from=builder /usr/src/app/main .

CMD [ "./main"]