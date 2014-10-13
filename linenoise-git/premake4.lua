solution "linenoise"
  language "C"
  configurations { "debug", "release" }

  configuration "debug"
    flags { "Symbols", "ExtraWarnings" }
    targetsuffix "-debug"

  configuration "release"
    flags { "OptimizeSpeed" }  

project "linenoise"
  kind "StaticLib"
  files { "linenoise.c, linenoise.h" }
  targetdir "lib"
  objdir "build/lib"

project "linenoise-example"
  kind "ConsoleApp"
  files { "*.c", "*.h" }
  libdirs {"./lib"}
  objdir "build/example"

  configuration { "linux", "gmake" }
    links { "linenoise" }
