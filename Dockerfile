FROM ubuntu:22.04

RUN DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true \
    truncate -s0 /tmp/preseed.cfg; \
    echo "tzdata tzdata/Areas select Europe" >> /tmp/preseed.cfg; \
    echo "tzdata tzdata/Zones/Europe select Madrid" >> /tmp/preseed.cfg; \
    debconf-set-selections /tmp/preseed.cfg && \
    rm -f /etc/timezone /etc/localtime && \
    apt-get update && \
    apt-get install -y tzdata

RUN DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true apt-get -qq -y update \
    && apt-get install -qq -y --no-install-recommends \
        curl \
        wget \
        default-jre \
        osmium-tool \
        osmosis \
        python3 \
        python3-geojson \
        python3-pip \
        python3-tk \
        gdal-bin \
        python3-gdal \
        zip \
        git \
        lzma \
    && apt-get clean \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

RUN wget -q 'https://search.maven.org/remotecontent?filepath=org/mapsforge/mapsforge-map-writer/0.21.0/mapsforge-map-writer-0.21.0-jar-with-dependencies.jar' -O mapsforge-map-writer-0.21.0-jar-with-dependencies.jar \
    && mkdir -p ~/.openstreetmap/osmosis/plugins \
    && mv mapsforge*jar  ~/.openstreetmap/osmosis/plugins

RUN bash -c "pip install requests shapely"
RUN bash -c "pip install wahoomc"
RUN bash -c "ln -s /usr/bin/python3 /usr/bin/python"

# Contour lines
RUN wget http://katze.tfiu.de/projects/phyghtmap/phyghtmap_2.23.orig.tar.gz && tar xzf phyghtmap_2.23.orig.tar.gz && cd phyghtmap-2.23 && python setup.py install
