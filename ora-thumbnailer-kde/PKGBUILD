# Maintainer: Jon Nordby <jononor@gmail.com>

pkgname=ora-thumbnailer-kde
_pkgname=ora-thumbnailers
pkgver=0.1.0
pkgrel=2
pkgdesc="OpenRaster thumbnailer for KDE (Dolphin/Kio)"
arch=('i686' 'x86_64')
url="http://create.freedesktop.org/wiki/OpenRaster"
license=('LGPL')
makedepends=('cmake')
depends=('kdelibs')
_sourceroot=http://www.jonnor.com/files
source=($_sourceroot/$_pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('9ccf397807a00561fab5b11873a17106')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  cd kde

  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  cd kde

  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
