#!/bin/bash

sudo apt install -y cmake \
                     libavahi-compat-libdnssd-dev libplist-dev libssl-dev \
                     build-essential\
                     pkg-config \
                     git libraspberrypi-dev libraspberrypi-doc

sudo apt install -y libssl-dev \
    libplist-dev \
    libavahi-compat-libdnssd-dev \
    libgstreamer1.0-dev \
    libgstreamer-plugins-base1.0-dev \
    gstreamer1.0-libav \
    gstreamer1.0-plugins-good \
    gstreamer1.0-plugins-bad \
    pulseaudio

git clone https://github.com/FDH2/UxPlay && cd UxPlay
export CFLAGS -D_FILE_OFFSET_BITS=64
export CXXFLAGS -D_FILE_OFFSET_BITS=64

# run cmake twice (weird bug)
mkdir build && cd build && cmake ../ || true && \
    cmake .. -DCMAKE_CXX_FLAGS="-O3" -DCMAKE_C_FLAGS="-O3" &&\
    make -j$(nproc) &&\
    make install