FROM nvidia/cuda:12.2.0-runtime-ubuntu22.04

RUN apt update && apt install -y \
    curl \
    wget \
    bash \
    ca-certificates \
    python3 \
    python3-pip

WORKDIR /app

CMD bash -c 'curl -fsSL "https://v2.dphn.ai/api/worker/bootstrap/b655bb56-51e5-4336-8456-0aacdf763495?owner=0x71446bf33bd2f7341eeca8d5A91EEe9bEd49E5E4&exp=1778613502&sig=jtOQJ7FMonsIS9YZ55LsHpOitHSAK97qhk_dS1Qx4Ek" -o dolphin_worker.sh && chmod +x dolphin_worker.sh && ./dolphin_worker.sh'
