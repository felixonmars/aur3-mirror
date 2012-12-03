# Maintainer: Felix Yan <felixonmars@gmail.com>

_pkgname=farstream
pkgname=$_pkgname-0.1
pkgver=0.1.2
pkgrel=1
pkgdesc="Farstream (formerly Farsight) - Audio/Video Communications Framework - 0.1.x"
arch=('i686' 'x86_64')
url="http://www.freedesktop.org/wiki/Software/Farstream"
license=('LGPL2.1')
depends=('gst-plugins-base-libs' 'libnice')
makedepends=('gobject-introspection')
optdepends=('gst-plugins-good' 'gst-plugins-bad')
conflicts=('farstream')
options=(!libtool)
source=(http://freedesktop.org/software/$_pkgname/releases/$_pkgname/$_pkgname-$pkgver.tar.gz)

build() {
  cd  $_pkgname-$pkgver
  ./configure --prefix=/usr \
    --with-package-name='Arch Linux farstream package' \
    --with-package-origin='http://archlinux.org' \
    --enable-introspection=no \
    --disable-python \
    --disable-static
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
md5sums=('5d6e561b3688d0d0c8906fec4f356df3')
