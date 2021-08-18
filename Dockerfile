FROM quay.io/urlstechie/urlchecker:0.0.22
RUN apt-get update && \
    /bin/bash -c "install_packages ca-certificates && \
    source activate urlchecker && \
    which python && \
    which pip && \
    python -m pip install --upgrade pip && \
    python -m pip install --upgrade certifi requests && \
    python -c 'import certifi; print(certifi.where())'"
#ENV REQUESTS_CA_BUNDLE /etc/ssl/certs/ca-certificates.crt
ENV REQUESTS_CA_BUNDLE /opt/conda/lib/python3.8/site-packages/certifi/cacert.pem
COPY entrypoint.sh /entrypoint.sh
WORKDIR /github/workspace
ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
