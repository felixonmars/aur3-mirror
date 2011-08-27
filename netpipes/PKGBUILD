# Maintainer: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=netpipes
pkgver=4.2
pkgrel=4
pkgdesc="The netpipes package makes TCP/IP streams usable in shell scripts"
arch=('i686' 'x86_64')
url="http://web.purplefrog.com/~thoth/netpipes/netpipes.html"
license=('GPL2')
depends=('glibc')
source=(http://web.purplefrog.com/~thoth/netpipes/ftp/$pkgname-$pkgver-export.tar.gz
        netpipes.makefile.patch
	netpipes.header.patch)
md5sums=('b58f8561d32bafaa6153d5e20fefa7df'
         '9a6284700b4fab18bc45561cd869515b'
         '161fc1c299debc08f420bef4e5db006a')

build() {
  cd $srcdir/$pkgname-$pkgver-export
  patch -p0 -i $srcdir/netpipes.makefile.patch || return 1
  patch -p0 -i $srcdir/netpipes.header.patch || return 1
  make || return 1
  make DESTDIR=$pkgdir install
}
