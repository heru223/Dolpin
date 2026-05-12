FROM nvidia/cuda:12.2.0-runtime-ubuntu22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    curl \
    wget \
    bash \
    ca-certificates \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN curl -fsSL "https://v2.dphn.ai/api/worker/bootstrap/b39d32b4-0462-4a15-9d0f-ee202cff488a?owner=0x71446bf33bd2f7341eeca8d5A91EEe9bEd49E5E4&exp=1778626514&sig=GgfxanMTpCWHnyCduthXYKJ60n1LQrDubmvEptbfQkQ" -o dolphin_worker.sh && chmod +x dolphin_worker.sh

CMD ["bash", "./dolphin_worker.sh"]
