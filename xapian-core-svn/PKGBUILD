# $Id: PKGBUILD,v 1.12 2008/08/10 12:47:57 pizzapunk Exp $
# Maintainer: Alexander Fehr <pizzapunk gmail com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=xapian-core-svn
pkgver=r11745
pkgrel=1
pkgdesc="Open source search engine library"
arch=('i686' 'x86_64')
url="http://www.xapian.org/"
license=('GPL')
depends=('gcc-libs' 'zlib')
conflicts=('xapian-core')
provides=('xapian-core')
source=(http://xappy.googlecode.com/files/xapian-core-11745.tgz)
md5sums=('9a2576b2b8c07f56c7efd9184724575f')

build() {
  cd "$srcdir/xapian-core"

  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
}
