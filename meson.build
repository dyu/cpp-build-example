project('cpp build test', 'cpp',
  default_options : 'cpp_std=c++14')

thread_dep = dependency('threads')
gtest_dep = dependency('gtest', main : true, required : false)

if not gtest_dep.found()
    gtest_proj = subproject('gtest')
    gtest_inc = gtest_proj.get_variable('incdir')
    gtest_proj.get_variable('incdir')
    gtest_lib = static_library('gtest', gtest_proj.get_variable('libsources'),
                                gtest_proj.get_variable('mainsources'),
                                include_directories : gtest_inc)

    gtest_dep = declare_dependency(include_directories : gtest_inc,
                               link_with : gtest_lib, dependencies: thread_dep)
endif

static_inc = include_directories('src/static/main')
shared_inc = include_directories('src/shared/main')

static_lib = static_library('static', 'src/static/main/greeting.cpp')

shared_lib = static_library('shared',
  'src/shared/main/add.cpp',
  'src/shared/main/multiply.cpp')

if meson.get_compiler('cpp').get_id() == 'clang'
  extra_args = ['--coverage']
else
  extra_args = []
endif

shared_gtest = executable('shared_gtest', 'src/shared/gtest/add_test.cpp', include_directories : shared_inc,
        dependencies : [gtest_dep], link_with: shared_lib, link_args : extra_args)

test('shared_gtest', shared_gtest, args: '--gtest_color=yes')

executable('executable',
  'src/executable/main/main.cpp',
  link_with : [static_lib, shared_lib],
  include_directories : [static_inc, shared_inc])
