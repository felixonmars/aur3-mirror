# Maintainer: Michael Whapples <mwhapples@aim.com>
# $Id: PKGBUILD 121204 2011-04-29 11:02:22Z ibiru $
# Contributor: Ionut Biru <ibiru@archlinux.org>
pkgname=pyatspi-git
pkgver=2.9.3
pkgrel=1
pkgdesc="Python bindings for at-spi"
arch=(any)
url="http://www.linuxfoundation.org/en/AT-SPI_on_D-Bus"
license=('GPL2')
depends=('pygobject-git' 'at-spi2-core')
conflicts=('pyatspi' 'python2-atspi')
provides=('pyatspi' 'python2-atspi')
source=('git://git.gnome.org/pyatspi2')
md5sums=('SKIP')
_gitname="pyatspi2"

pkgver() {
  cd $srcdir/$_gitname
  git describe --always | sed 's+_+.+g' | cut -c9- 
}

build() {
  cd $srcdir/$_gitname
  sed '/AC_PATH_XTRA/d' -i configure.ac
  # autoreconf
  PYTHON=/usr/bin/python2 ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$srcdir/${_gitname}"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
