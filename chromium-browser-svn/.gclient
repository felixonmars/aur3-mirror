# An element of this array (a "solution") describes a repository directory
# that will be checked out into your working copy.  Each solution may
# optionally define additional dependencies (via its DEPS file) to be
# checked out alongside the solution's directory.  A solution may also
# specify custom dependencies (via the "custom_deps" property) that
# override or augment the dependencies specified by the DEPS file.
# If a "safesync_url" is specified, it is assumed to reference the location of
# a text file which contains nothing but the last known good SCM revision to
# sync against. It is fetched if specified and used unless --head is passed

solutions = [
  { "name"        : "src",
    "url"         : "http://src.chromium.org/svn/trunk/src",
    "custom_deps" : {
      # To use the trunk of a component instead of what's in DEPS:
      #"component": "https://svnserver/component/trunk/",
      # To exclude a component from your working copy:
      #"data/really_large_component": None,

      "src/chrome_frame": None,
      "src/chrome/test/data": None,
      "src/chrome/tools/test/reference_build": None,
      "src/chrome_frame": None,
      "src/content/test/data/layout_tests/LayoutTests": None,
      "src/gears/binaries": None,
      "src/net/data/cache_tests": None,
      "src/o3d/documentation": None,
      "src/o3d/samples": None,
      "src/third_party/lighttpd": None,
      "src/third_party/WebKit/LayoutTests": None,
      "src/third_party/skia": None,
      "src/webkit/data/layout_tests": None,
      "src/webkit/tools/test/reference_build": None,
      "src/third_party/ffmpeg/binaries/": None,
      "src/third_party/hunspell_dictionaries": None,
    },
    "safesync_url": "http://build.chromium.org/buildbot/continuous/linux/LATEST/REVISION"
  },
]
