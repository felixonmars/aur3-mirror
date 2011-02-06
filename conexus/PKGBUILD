# Maintainer: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>

pkgname=conexus
pkgver=0.9.1
pkgrel=1
pkgdesc="A generalized C++ I/O library for IPv4 and IPv6 sockets, serial/TTY, kernel message queues, pipes, and files"
arch=('i686' 'x86_64')
url="http://conexus.wiki.sourceforge.net/"
license=('GPL3')
depends=('glibmm' 'nss' 'openssl')
options=('!libtool' '!emptydirs')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('baff7b112c91af2b086d6811deac7dff')

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure --prefix=/usr --enable-static=no

  make || return 1
}

package() {
  cd $srcdir/$pkgname-$pkgver

  make DESTDIR=$pkgdir install || return 1
}

# vim:set ts=2 sw=2 et:
