import os, sys

common_flags = '-shared -Wno-deprecated -O3 -Wno-unknown-pragmas -fPIC -D_REENTRANT -DNDEBUG -DSC_MEMORY_ALIGNMENT=16'

env = Environment(
	CCFLAGS = '-DSC_LINUX ' + common_flags
)

libsndfile	= '/usr/include/libsndfile'
sc_server	= '/usr/include/SuperCollider/include/server'
sc_common	= '/usr/include/SuperCollider/include/common'
sc_plugin_interface = '/usr/include/SuperCollider/include/plugin_interface'
include_paths	= [sc_plugin_interface, libsndfile, sc_server, sc_common]

output_name	= 'TJUGens.so'

env.SharedLibrary(output_name, Glob('*.cpp'), CPPPATH=include_paths, SHLIBPREFIX='')
