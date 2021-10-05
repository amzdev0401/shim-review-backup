FROM ubuntu:18.04
LABEL MAINTAINER AmZetta Technologies <sales@amzetta.com>

RUN apt-get update
RUN apt-get install -y build-essential git curl

LABEL VERSION ="1.0"
LABEL DESCRIPTION ="Docker Image To build Shim 15.04 for AmZetta Technologies."

WORKDIR /opt
RUN  git clone --recursive -b main https://github.com/amzdev0401/shim.git shim
WORKDIR /opt/shim
RUN curl -O  https://github.com/amzdev0401/shim-review/main/amzetta.der
RUN make VENDOR_CERT_FILE=amzetta.der
RUN sha256sum shimx64.efi
RUN objdump -s -j .sbat shimx64.efi

