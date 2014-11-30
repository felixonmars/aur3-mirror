# Maintainer: TDY <tdy@archlinux.info>

pkgname=divfixpp-svn
pkgver=98
pkgrel=1
pkgdesc="A tool for repairing corrupted AVI file streams"
arch=('i686' 'x86_64')
url="http://divfixpp.sourceforge.net/"
license=('GPL')
depends=('wxgtk')
makedepends=('gettext' 'libwebkit' 'subversion')
provides=('divfixpp')
conflicts=('divfixpp')
source=($pkgname::svn+http://svn.code.sf.net/p/divfixpp/code/trunk)
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  local ver="$(svnversion)"
  printf "%s" "${ver//[[:alpha:]]}"
}

build() {
  cd $pkgname
  if [[ ! $(grep -q '#include\s*<stdint\.h>' src/DivFix++Core.h) ]]; then
    sed -i '42 a\#include <stdint.h>' src/DivFix++Core.h
  fi
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir/" install
  ln -sf DivFix++ "$pkgdir/usr/bin/divfixpp"
}

# vim:set ts=2 sw=2 et:
