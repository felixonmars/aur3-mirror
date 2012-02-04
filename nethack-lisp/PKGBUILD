# $Id$
# Contributor : Peter Feigl <peter.feigl@gmail.com>

pkgname=nethack-lisp
pkgver=3.4.3
pkgrel=1
pkgdesc='A single player dungeon exploration game. Lisp patch for nethack-el.'
arch=('i686' 'x86_64')
url="http://www.nongnu.org/nethack-el/"
license=('custom')
depends=('ncurses' 'gzip' 'emacs')
conflicts=('nethack')
source=(http://downloads.sourceforge.net/sourceforge/nethack/nethack-343-src.tgz http://mirror.lihnidos.org/GNU/savannah/nethack-el/nethack_el-0.9.5.tar.gz)

build(){
  xpkgname=nethack
  xpkgver=3.4.3
  cd $startdir/src/$xpkgname-$xpkgver/
  patch -p 1 < ../nethack_el-0.9.5/enh-343.patch
  cd $startdir/src/$xpkgname-$xpkgver/sys/unix
  sh setup.sh

  cd $startdir/src/$xpkgname-$xpkgver/include
  sed -e '/define HACKDIR/ s|/usr/games/lib/nethackdir|/usr/share/nethack/|' \
      -e '/^#define COMPRESS\s/ s|/usr/bin/compress|/bin/gzip|' \
      -e '/^#define COMPRESS_EXTENSION/ s|".Z"|".gz"|' \
      -e 's|^/\* \(#define DLB\) \*/|\1|' -i config.h
  sed -e 's|^/\* \(#define LINUX\) \*/|\1|' \
      -e 's|^/\* \(#define TIMED_DELAY\) \*/|\1|' -i unixconf.h
  cd $startdir/src/$xpkgname-$xpkgver/src
#  sed -e 's|^# \(WINTTYLIB = -lncurses\)|\1|' \
#      -e 's|^WINTTYLIB = -ltermlib|#&|' -i Makefile
  cd ..
  sed -e '/^GAMEDIR\s*=/ s|/games/.*$|/share/$(GAME)|' \
      -e '/^GAMEUID\s*=/ s|games|root|' \
      -e '/^GAMEGRP\s*=/ s|bin|root|' \
      -e '/^SHELLDIR\s*=/ s|/games|/bin|' -i Makefile

  make || return 1
  make PREFIX=$startdir/pkg/usr install
  mv $startdir/pkg/usr/bin/nethack $startdir/pkg/usr/bin/nethack-lisp
  sed -e 's|HACKDIR=.*/pkg/usr/|HACKDIR=/usr/|' \
      -i $startdir/pkg/usr/bin/nethack
  install -Dm644 dat/license $startdir/pkg/usr/share/licenses/nethack/license
}
source /etc/makepkg.conf

md5sums=('21479c95990eefe7650df582426457f9'
         'e8e08e1eeb5506871fe7d84e5d0a52b0')
