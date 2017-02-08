## meson
```sh
mkdir build && cd build
meson ..
ninja
ninja test

# run
./executable
```

## buck
```sh
buck build //:executable
buck test //:shared_gtest

# run
./buck-out/gen/executable
```
