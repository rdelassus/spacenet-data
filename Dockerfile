FROM ubuntu:14.04

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:ubuntugis/ubuntugis-unstable && \
    apt-get update

RUN apt-get install -y \
    python-dev \
    python-numpy \
    python-pip \
    gdal-bin \
    libgdal-dev \
    parallel \
    ghostscript \
    imagemagick

RUN pip install -U pip && \
    pip install awscli rasterio

RUN apt-get install python-gdal

WORKDIR /workspace
ADD . /workspace
ENV SHELL=/bin/bash
ENTRYPOINT ["./prep_data", "/spacenet", "/data"]
CMD ["NOT_SET"]
