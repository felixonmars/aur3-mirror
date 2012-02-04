# Contributor: Your Name <korin43 at gmail dot com>

pkgname=phc
pkgver=0.2.0.3
pkgrel=4
pkgdesc="the open source php compiler"
arch=('i686' 'x86_64')
url="http://www.phpcompiler.org/"
license=('BSD')
groups=()
depends=('php-embed')
makedepends=('boost' 'gc')
optdepends=('graphviz: to view graphical output (like syntax trees)' 
'xerces-c: support for XML parsing (not needed for XML unparsing)')
provides=('phc')
conflicts=()
replaces=()
backup=()
options=()
source=(http://phc.googlecode.com/files/$pkgname-$pkgver.tar.bz2)
noextract=()
md5sums=('0dff922b0e49caf243674e1b9fe38792')

build() {
  cd $srcdir/$pkgname-$pkgver
  LDFLAGS="" ./configure --prefix=/usr --with-php=/usr
  make || return 1
  make DESTDIR=$pkgdir install || return 1
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  cp doc/license/LICENSE $pkgdir/usr/share/licenses/$pkgname/COPYING
}
