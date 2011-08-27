# Contributor: flx <effelleks@googlemail.com>
pkgname=nget
pkgver=0.27.1
pkgrel=1
pkgdesc="A command line nntp file grabber."
arch=('i686')
url="http://nget.sourceforge.net/"
license=('GPL')
depends=('pcre' 'popt' 'zlib')
install=nget.install
source=(http://downloads.sourceforge.net/sourceforge/nget/$pkgname-$pkgver+uulib.tar.gz
		nget-gcc42.patch)

build() {
  cd "$startdir/src/$pkgname-$pkgver"
  patch -p1<../nget-gcc42.patch || return 1	
  ./configure --prefix=/usr --with-pcre
  make || return 1
  install -D -m755 ./nget ${startdir}/pkg/usr/bin/nget	
  install -D -m755 ./ngetlite ${startdir}/pkg/usr/bin/ngetlite	
  install -D -m644 ./nget.1 ${startdir}/pkg/usr/man/man1/nget.1	
  install -D -m644 ./ngetlite.1 ${startdir}/pkg/usr/man/man1/ngetlite.1	
  install -D -m644 ./.ngetrc ${startdir}/pkg/etc/ngetrc.sample
}

md5sums=('cefb58ad9b92eb6053510a2ced954f6e'
         '16570146fc06471c624c2f3a259983b4')
# vim:set ts=2 sw=2 et:
