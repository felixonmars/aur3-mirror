# Maintainer: Thomas Weißschuh <thomas t-8ch de>
# Contributor: James Reed <supplantr at archlinux dot info>

pkgname=tcplay
pkgver=1.1
pkgrel=1
pkgdesc="Free and simple TrueCrypt implementation based on dm-crypt."
arch=('i686' 'x86_64')
url="https://github.com/bwalex/tc-play"
license=('BSD')
depends=('libgcrypt' 'util-linux' 'device-mapper')
makedepends=('cmake')
source=("https://github.com/bwalex/tc-play/archive/v${pkgver}.tar.gz"
        "sbin-dir-usr-move.patch")

build() {
  cd "$srcdir/tc-play-$pkgver"
  patch -p0 -i "$srcdir/sbin-dir-usr-move.patch"
  rm -rf objdir
  mkdir objdir
  cd objdir
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$srcdir/tc-play-$pkgver/objdir"
  make DESTDIR="$pkgdir" install
}

sha256sums=('62346e852c6f781fffebf5c43e5967ceb0e36304626aa27e77c77378f8215d84'
            'b31ed9c5c31b6157d69a1aa7a0ccb7f30435af182e02a32faf9005f18b73b923')
