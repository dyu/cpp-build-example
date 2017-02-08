cxx_library(
    name = 'shared',
    srcs = glob(['src/shared/main/*.cpp']),
    exported_headers = subdir_glob([("src/shared/main", "*.h")]),
    visibility = ['PUBLIC'],
    #compiler_flags = [ '-fPIC', '-shared' ],
    #preferred_linkage = 'shared',
    #exported_linker_flags = '-L$(location //:shared)',
)

cxx_test(
    name = 'shared_gtest',
    srcs = glob(['src/shared/gtest/*.cpp']),
    framework = 'gtest',
    deps = [
        ':shared',
    ],
)

cxx_library(
    name = 'static',
    srcs = glob(['src/static/main/*.cpp']),
    exported_headers = subdir_glob([("src/static/main", "*.h")]),
    visibility = ['PUBLIC'],
)

cxx_binary(
 name = 'executable',
 srcs = glob(['src/executable/main/*.cpp']),
 deps = [
    ':static',
    ':shared',
 ],
)
