# Contributor: Paul Bredbury <brebs@sent.com>

pkgname=kmquake2
pkgver=0.19.2
pkgrel=2
pkgdesc="Enhanced Quake 2 engine with Lazarus mod support"
arch=(i686 x86_64)
url="http://qudos.quakedev.com/"
license=('GPL')
# glib is required if compiling with xmms. openal is needed, to build.
depends=('alsa-lib' 'glib' 'libjpeg' 'libpng' 'libvorbis' 'libxxf86vm' 'mesa')
makedepends=('xf86vidmodeproto' 'openal')
install=kmquake2.install
source=(http://qudos.quakedev.com/linux/quake2/engines/KMQuake2/KMQuake2-SDL-${pkgver}_src_unix.tar.bz2
        http://qudos.quakedev.com/linux/quake2/engines/KMQuake2/KMQuake2_data-0.19.tar
        kmquake2.desktop
        no-save-date-check.patch)
md5sums=('afd17d507c92b353a598a4109c58df74'
         '081d2e1c149830a0863c1296ecbf0f77'
         'ec39757b864fb855a0625dbf365ac1c1'
         '75b3ab74e05a7fce0311b8c1f918935d')

_gamedir="/usr/share/quake2"
_libdir="/usr/lib/kmquake2"

build() {
  cd $startdir/src/KMQuake2-SDL-${pkgver}_src_unix

  # Fix for x86_64 - http://bugs.gentoo.org/show_bug.cgi?id=158415
  sed -i \
    -e "s:\#include <sys/types\.h>:\#define _GNU_SOURCE\n\#include <sys/types\.h>:" \
    unix/qsh_unix.c || return 1

  # Fix directory search for the game API
  sed -i \
    -e 's:"%s/%s/%s", curpath, path, gamename:"%s/%s", path, gamename:' \
    unix/sys_unix.c || return 1

  # Remove restriction on loading games from a "previous version"
  # From http://bugs.gentoo.org/show_bug.cgi?id=140121
  patch -Np0 -i ../no-save-date-check.patch || return 1

  # Favours OpenGL over SDL (SDL uses OpenAL audio).
  # Not sure whether ALSA or OSS is best, but user has choice with command-line:
  #   kmquake2 +set sndalsa 1
  # XMMS is disabled because the Makefile blindly assumes it is installed.
  # The dedicated server is always built anyway.
  make \
    BUILD_DEDICATED=YES \
    BUILD_KMQUAKE2=YES \
    BUILD_KMQUAKE2_SDL=NO \
    WITH_XMMS=NO \
    DATADIR="${_gamedir}" \
    LIBDIR="${_libdir}" \
    LOCALBASE="/usr" \
    BUILD_DATADIR=YES \
    BUILD_LIBDIR=YES \
    release || return 1

  install -d $startdir/pkg/$_libdir/baseq2/
  install -m755 quake2/baseq2/*.so $startdir/pkg/$_libdir/baseq2/ || return 1

  install -D -m755 quake2/kmquake2 $startdir/pkg/usr/bin/kmquake2 || return 1
  install -D -m755 quake2/kmquake2_netserver $startdir/pkg/usr/bin/kmquake2-ded || return 1
  install -m644 ../KMQuake2_data-0.19/baseq2/*.pk3 $startdir/pkg/$_libdir/baseq2/ || return 1

  # Desktop entry
  install -D -m644 ../KMQuake2_data-0.19/kmquake2.png $startdir/pkg/usr/share/pixmaps/kmquake2.png || return 1
  install -D -m644 ${startdir}/kmquake2.desktop $startdir/pkg/usr/share/applications/kmquake2.desktop || return 1

  # Docs
  rm gnu.txt
  install -d $startdir/pkg/usr/share/doc/kmquake2/
  install -m644 -t $startdir/pkg/usr/share/doc/kmquake2/ *.{txt,unix} || return 1
}
