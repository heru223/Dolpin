FROM nvidia/cuda:12.2.0-runtime-ubuntu22.04

RUN apt update && apt install -y \
    curl \
    wget \
    bash \
    ca-certificates \
    python3 \
    python3-pip

WORKDIR /app

RUN curl -fsSL "https://v2.dphn.ai/api/worker/bootstrap/b39d32b4-0462-4a15-9d0f-ee202cff488a?owner=0x71446bf33bd2f7341eeca8d5A91EEe9bEd49E5E4&exp=1778623891&sig=oUedo9w8veRt1m03G58xemyN-qlZfgsq1rT97pSa5w8" -o dolphin_worker.sh && chmod +x dolphin_worker.sh

CMD ["bash", "-c", "./dolphin_worker.sh"]
