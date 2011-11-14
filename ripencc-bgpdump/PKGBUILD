# Maintainer: Georges Discry <murmex at gathex dot net>
pkgname=ripencc-bgpdump
pkgver=1.4.99.13
pkgrel=1
pkgdesc="A C library designed to help with analyzing BGP table dumps and recorded updates in MRT format"
arch=('i686' 'x86_64')
url="https://bitbucket.org/ripencc/bgpdump/"
license=('GPL')
depends=('zlib' 'bzip2')
source=("https://bitbucket.org/ripencc/bgpdump/get/$pkgver.tar.gz"
        'remove-testbgpdump.patch'
        'makefile-install.patch')
md5sums=('72f800dbefc20db99042a23ffae18738'
         'd2d7aa9c796008c675081ef4cad873fb'
         '7e434983f19cd2ecdbe1378f45e1f4f4')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -uNp0 -i '../remove-testbgpdump.patch'
  patch -uNp0 -i '../makefile-install.patch'
  autoheader
  autoconf
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
