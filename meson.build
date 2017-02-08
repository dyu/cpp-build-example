project('cpp build test', 'cpp',
  default_options : 'cpp_std=c++14')

boost_dep = dependency('boost',
  modules : ['date_time', 'test'])

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

stinc = include_directories('src/static/main')
shinc = include_directories('src/shared/main')

stat = static_library('static', 'src/static/main/greeting.cpp',
  dependencies : boost_dep)

stat_exe = executable('test_static',
  'src/static/test/test.cpp',
  'src/static/test/greeting_test.cpp',
  link_with : stat,
  include_directories : stinc)
test('static', stat_exe)

shar = shared_library('shared',
  'src/shared/main/add.cpp',
  'src/shared/main/multiply.cpp')
shar_exe = executable('test_shared',
  'src/shared/test/test.cpp',
  'src/shared/test/add_test.cpp',
  'src/shared/test/multiply_test.cpp',
  dependencies : boost_dep,
  include_directories : shinc,
  link_with : shar)
test('shared', shar_exe)

executable('executable',
  'src/executable/main/main.cpp',
  link_with : [stat, shar],
  dependencies : boost_dep,
  include_directories : [stinc, shinc])
