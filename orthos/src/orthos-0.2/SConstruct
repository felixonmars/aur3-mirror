import os

env=Environment(ENV=os.environ)
env['CC']='g++'
env['CCFLAGS']='-O2 -Wall'
env['CPPPATH']=['#include/']
env.SetOption("num_jobs",2);

# debug
# env['CCFLAGS']+=' -DDEBUG=1 -g '

env['LIBS']=['crypt','Xmu']

Export('env')

objs=SConscript("src/SConscript")
SConscript("skins/SConscript")
env.Program("orthos",objs)


