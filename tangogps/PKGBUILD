# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=tangogps
pkgver=0.99.4
pkgrel=1
pkgdesc="Lightweight and fast mapping application"
arch=('i686' 'x86_64')
url="http://www.tangogps.org/"
license=('GPL')
depends=('curl' 'bluez' 'gconf' 'libexif' 'libsoup')
optdepends=('gpsd: for GPS support')
source=(http://www.tangogps.org/downloads/$pkgname-$pkgver.tar.gz)
sha256sums=('660fdf89ef3c379f2fc0c2a9d0c9d3bfa5345835786b72bf9f513ba9ec2c812a')

build() {
  cd ${srcdir}/$pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/$pkgname-$pkgver

  make DESTDIR=${pkgdir} install  

#remove worthless docdir
  rm -rf ${pkgdir}/usr/doc
}
