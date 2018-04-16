FROM golang:alpine

RUN apk add --no-cache python3 ruby

ADD go /go/src/github.com/mewa/rpn

WORKDIR /go/src/github.com/mewa/rpn

RUN go get ./...
RUN go install -i ./...

ADD python python
ADD ruby ruby

CMD ["rpn"]
