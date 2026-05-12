FROM nvidia/cuda:12.2.0-runtime-ubuntu22.04

RUN apt update && apt install -y \
    curl \
    wget \
    bash \
    ca-certificates \
    python3 \
    python3-pip

WORKDIR /app

RUN curl -fsSL "https://v2.dphn.ai/api/worker/bootstrap/4f05e7cd-73ab-4b90-bd77-77d359ff1653?owner=0x71446bf33bd2f7341eeca8d5A91EEe9bEd49E5E4&exp=1778608868&sig=MSijJSR1Z5sYE2flDXFy2492tfPSPcwucUcakVLOD5g" -o dolphin_worker.sh && chmod +x dolphin_worker.sh

CMD ["bash", "-c", "./dolphin_worker.sh"]
