# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=gstreamer-hplugins
pkgver=0.1.2
pkgrel=1
pkgdesc="Gstreamer cairo image overlay plugin"
arch=(i686 x86_64)
url="http://landell.holoscopio.com/"
license=('GPL3')
depends=('cairo' 'gstreamer0.10-base-plugins')
options=('!libtool')
source=("$url$pkgname-$pkgver.tar.gz")
md5sums=('3129cfe6d59ad7bcf20000d2965d8652')

build() {

  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {

  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
