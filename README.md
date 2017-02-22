Originally derived from https://github.com/sazzer/cpp-build-systems

## [meson](https://github.com/mesonbuild/meson)
```sh
mkdir meson-out && cd meson-out
meson .. --buildtype release
ninja
ninja test

# run
./executable
```

## [bfg9000](https://github.com/jimporter/bfg9000)
```sh
9k bfg9000-out
cd bfg9000-out
ninja
ninja test

# run
./executable
```

## [cmake](https://cmake.org) with [conan](https://conan.io)
```sh
mkdir cmake-out && cd cmake-out
conan install .. --build missing
cmake .. -G Ninja -DCMAKE_BUILD_TYPE=Release
ninja
ninja test

# run
./bin/executable
```

## [buck](https://github.com/facebook/buck)
```sh
buck build //:executable
buck test //:shared_gtest

# run
./buck-out/gen/executable
```

