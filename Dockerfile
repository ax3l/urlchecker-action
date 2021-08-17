FROM quay.io/urlstechie/urlchecker:0.0.22
RUN python3 -m pip install --upgrade certifi
COPY entrypoint.sh /entrypoint.sh
WORKDIR /github/workspace
ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
