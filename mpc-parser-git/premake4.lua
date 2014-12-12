solution "mpc"
  language "C"
  configurations { "debug", "release" }

  configuration "debug"
    flags { "Symbols", "ExtraWarnings" }
    targetsuffix "-debug"

  configuration "release"
    flags { "OptimizeSpeed" }

project "mpc"
  kind "StaticLib"
  files { "mpc.c", "mpc.h" }
  targetdir "lib"
  objdir "build/lib"

  configuration { "linux", "gmake" }
    links { "mpc-parser" }
