# Maintainer: Joao Cordeiro <jlcordeiro at gmail dot com>
# Contributor: Stefan Lohmaier <noneus@@@@@@@noneus.DOT:de>
pkgname=nmrename-svn
pkgver=45
pkgrel=1
pkgdesc="Mass renaming tool for the cmdline"
arch=('i686' 'x86_64')
url="http://nmrename.sf.net"
license=('GPL')
depends=('glibc' 'libexif')
makedepends=()
conflicts=(nmrename)
replaces=(nmrename)

_svntrunk=https://nmrename.svn.sourceforge.net/svnroot/nmrename/trunk
_svnmod=nmrename

build() {

  mkdir -p $pkgname/usr/bin

  cd $srcdir

  svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod

  cd $_svnmod

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  make || return 1
  make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
