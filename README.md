Originally derived from https://github.com/sazzer/cpp-build-systems

## [meson](https://github.com/mesonbuild/meson)
```sh
mkdir build && cd build
meson .. --buildtype release
ninja
ninja test

# run
./executable
```

## [buck](https://github.com/facebook/buck)
```sh
buck build //:executable
buck test //:shared_gtest

# run
./buck-out/gen/executable
```

## [bfg9000](https://github.com/jimporter/bfg9000)
```sh
9k build9k
cd build9k
ninja
ninja test
```
