FROM nixos/nix:latest AS builder

COPY . /tmp/build
WORKDIR /tmp/build

RUN mkdir -p /root/.config/nix \
	&& echo "experimental-features = nix-command flakes" > /root/.config/nix/nix.conf

RUN nix build .#build --out-link result

RUN mkdir /tmp/nix-store-closure
RUN cp -R $(nix-store -qR result/) /tmp/nix-store-closure

FROM node:latest AS ui-builder

COPY . /src
WORKDIR /src

RUN npm ci && npm run build

FROM alpine:latest

ENV PATH=/bin

COPY --from=builder /tmp/nix-store-closure /nix/store
COPY --from=builder /tmp/build/result /app

COPY --from=ui-builder /src/_build/dist /_build/dist

EXPOSE 42069

ENTRYPOINT ["/app/bin/main"]
