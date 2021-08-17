FROM quay.io/urlstechie/urlchecker:0.0.22
RUN /bin/bash -c "source activate urlchecker && \
    which python && \
    python -m pip install --upgrade certifi requests"
COPY entrypoint.sh /entrypoint.sh
WORKDIR /github/workspace
ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
