FROM ubuntu:latest

RUN DEBIAN_FRONTEND=noninteractive apt-get -qq -y update \
    && apt-get install -qq -y --no-install-recommends \
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
        lzma \
    && apt-get clean \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

RUN wget -q 'https://search.maven.org/remotecontent?filepath=org/mapsforge/mapsforge-map-writer/0.18.0/mapsforge-map-writer-0.18.0-jar-with-dependencies.jar' -O mapsforge-map-writer-0.18.0-jar-with-dependencies.jar \
    && mkdir -p ~/.openstreetmap/osmosis/plugins \
    && mv mapsforge*jar  ~/.openstreetmap/osmosis/plugins

RUN bash -c "pip install requests shapely"
RUN bash -c "pip install wahoomc"
RUN bash -c "ln -s /usr/bin/python3 /usr/bin/python"
