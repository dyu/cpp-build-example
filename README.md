Originally derived from https://github.com/sazzer/cpp-build-systems

Static libs by default to work on windows (only buck does not run on windows)

### Linux
Install g++ (4.9 or higher)

### Windows
Install [vc build tools 2015](http://go.microsoft.com/fwlink/?LinkId=691126&fixForIE=.exe).

Exec this before running the builds.
```
call "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat" x64
```

### Tool-specific requirements
Go to their homepage and install the their respective dependencies.

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

## [gn](https://chromium.googlesource.com/chromium/src/tools/gn/+/HEAD/README.md)
Very similar to [bazel](https://bazel.build) with a few [differences](https://chromium.googlesource.com/chromium/src/tools/gn/+/HEAD/docs/language.md#Differences-and-similarities-to-Blaze)

### Setup
Download the [binary](http://refi64.com/gn-builds/) appropriate for your platform and add it to your exec PATH.
```
# print out your gn version (At the time of this writing, mine was 446079)
gn --version

# import the cross-platform build config/toolchain template
git clone --depth 1 --single-branch -b master https://github.com/dyu/gn-build build
```

### Linux
```
gn gen gn-out --args='gcc_cc="gcc" gcc_cxx="g++" is_debug=false is_clang=false is_official_build=true'
```

### Windows
```
gn gen gn-out --args="visual_studio_path=\"C:\\Program Files (x86)\\Microsoft Visual Studio 14.0\" visual_studio_version=\"2015\" is_debug=false is_clang=false is_official_build=true"
```

```sh
ninja -C gn-out

# run
./gn-out/executable
```

