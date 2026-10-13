FROM golang:1.27 AS build
WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o server .

FROM scratch
WORKDIR /app
COPY --from=build /app/server .
ENTRYPOINT [ "./server" ]