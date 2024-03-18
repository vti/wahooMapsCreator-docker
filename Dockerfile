ARG BASE_IMAGE=debian:12-slim
FROM ${BASE_IMAGE}

# Install System Dependencies
RUN --mount=type=cache,target=/var/cache/apt --mount=type=cache,target=/var/lib/apt \
  DEBIAN_FRONTEND=noninteractive apt-get -qq -y update && \
  apt-get install -qq -y --no-install-recommends \
  wget \
  default-jre \
  osmium-tool \
  osmosis \
  python3 \
  python3-geojson \
  python3-pip \
  python3-requests \
  python3-shapely \
  python3-tk \
  gdal-bin \
  python3-gdal \
  zip \
  lzma

# Install wahoomc
RUN --mount=type=cache,target=/root/.cache/pip \
  pip install --break-system-packages \
  wahoomc

# Install Auxiliary Tools
RUN python3 -c "from wahoomc import main; main.run('init')"

WORKDIR "/app"
ENTRYPOINT ["python3", "-m", "wahoomc", "cli"]
