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
buck build executable

# run
./buck-out/gen/executable
```
