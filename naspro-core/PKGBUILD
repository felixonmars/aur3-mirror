# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=naspro-core
pkgver=0.5.0
pkgrel=1
pkgdesc="The portable runtime library at the bottom of the NASPRO Sound PROcessing Architecture."
arch=('i686' 'x86_64')
url="http://naspro.sourceforge.net/"
license=('LGPL')
groups=('naspro')
depends=('glibc')
makedepends=('naturaldocs')
options=('!libtool')
source=("http://download.sourceforge.net/project/naspro/naspro/$pkgver/$pkgname-$pkgver.tar.bz2")
md5sums=('5075abc5e39417e9bbef595d546bbdde')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr \
              --enable-static=no

  make && make html
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
