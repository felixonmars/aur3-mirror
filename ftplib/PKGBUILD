# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: andreas_baumann <abaumann@yahoo.com>
# Contributor: Nathan O <ndowens04 at gmail dot com>

pkgname=ftplib
pkgver=4.0
pkgrel=1
pkgdesc="A set of routines that implement the FTP protocol"
url="http://nbpfaus.net/~pfau/$pkgname/"
arch=('i686' 'x86_64')
license=('Artistic2.0')
depends=('glibc')
source=("$url$pkgname-$pkgver.tar.gz")
md5sums=('846c30323ee64850559cecb311118460')

prepare() {
  cd "$srcdir/$pkgname-$pkgver/src"

  # strip local
  sed -i "s@/usr/local@${pkgdir}/usr@g" Makefile
}

build() {
  cd "$srcdir/$pkgname-$pkgver/src"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/src"

  install -d ${pkgdir}/usr/{bin,lib,include}
  make install
}
