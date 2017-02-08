cxx_library(
    name = 'shared',
    srcs = glob(['src/shared/main/*.cpp']),
    exported_headers = subdir_glob([("src/shared/main", "*.h")]),
    visibility = ['PUBLIC'],
    compiler_flags = [ '-std=c++14', '-Wall' ] #, '-fPIC', '-shared' ],
    #preferred_linkage = 'shared',
    #exported_linker_flags = '-L$(location //:shared)',
)

cxx_library(
    name = 'static',
    srcs = glob(['src/static/main/*.cpp']),
    exported_headers = subdir_glob([("src/static/main", "*.h")]),
    visibility = ['PUBLIC'],
    compiler_flags = [ '-std=c++14', '-Wall' ],
)

cxx_binary(
 name = 'executable',
 srcs = glob(['src/executable/main/*.cpp']),
 deps = [
    ':static',
    ':shared',
 ],
 compiler_flags = [ '-std=c++14', '-Wall' ],
)
