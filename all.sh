#!/bin/sh

CURRENT_DIR=$PWD

rm -rf meson-out bfg9000-out buck-out

# meson
mkdir meson-out && cd meson-out && meson .. --buildtype release && ninja && ninja test && \
    ./executable

cd $CURRENT_DIR

# bfg9000
9k bfg9000-out && cd bfg9000-out && ninja && ninja test && \
    ./executable

cd $CURRENT_DIR

# buck
buck build //:executable && buck test //:shared_gtest && \
    ./buck-out/gen/executable


