# Maintainer: Noel Maersk <veox ta wemakethings tod net>
# Contributor: Lex Rivera <x-demon@x-demon.org>

pkgname=madwimax
pkgver=0.1.1
pkgrel=2
pkgdesc="A reverse-engineered linux driver for Mobile Wimax (802.16e) devices based on Samsung CMC-730 chip."
arch=('i686' 'x86_64')
url="http://code.google.com/p/madwimax/"
license=('GPL2')
depends=('bash' 'libusb')
makedepends=('asciidoc' 'docbook-xsl' 'docbook2x')
optdepends=('dhclient')
conflicts=('madwimax-svn' 'madwimax-git')
source=(http://madwimax.googlecode.com/files/$pkgname-$pkgver.tar.gz 'configure.ac.patch')
md5sums=('4ebd2d74e887e6f9d6f23067a4ad8272'
         '293533d7cc2c13f36501818f10891739')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  patch -p0 -i ${srcdir}/configure.ac.patch
}

build() {
  cd $srcdir/$pkgname-$pkgver
  autoreconf --install
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
# vim:syntax=sh
