# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Maintainer: kontakt.zuf@gmail.com
# Maintainer: Lucas Saliés Brum <lucas@archlinux.com.br>

pkgname=tangogis
pkgver=1.0.0
pkgrel=1
pkgdesc="Lightweight and fast mapping application - a fork of tangogps"
arch=('i686' 'x86_64')
url="https://code.google.com/p/tangogis/"
license=('GPL')
depends=('curl' 'cmake' 'bluez' 'gconf' 'libexif' 'libsoup')
optdepends=('gpsd: for GPS support')
source=(https://tangogis.googlecode.com/files/$pkgname-$pkgver.tar.bz2 build.patch)
md5sums=('885e9ca505ea12a4286c649abc23d80f'
         '73a32a85a9c5e2e0729f82d2a20c0c2d')

build() {
  cd ${srcdir}/$pkgname-$pkgver

  patch -p1 -i build.patch

  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd ${srcdir}/$pkgname-$pkgver/build
  make DESTDIR="$pkgdir" install
}
