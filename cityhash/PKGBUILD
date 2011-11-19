# Maintainer: Alexey Syrnikov <san@3d-spline.ru>
pkgname=cityhash
pkgver=1.0.3
pkgrel=1
pkgdesc="Cityhash hash functions from Google"
arch=('x86_64')
url="https://code.google.com/p/cityhash/"
license=('MIT')
#groups=()
depends=('glibc')
makedepends=()
#optdepends=()
#provides=()
#conflicts=()
#replaces=()
#backup=()
#options=()
#install=
#changelog=
source=(http://cityhash.googlecode.com/files/$pkgname-$pkgver.tar.gz)
#noextract=()
md5sums=('4d1a1102e696e699613c93ca8aeddd00')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
