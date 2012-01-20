# Maintainer: Joni Lapilainen <joni.lapilainen@gmail.com>
pkgname=gst-dsp
pkgver=0.10.0
pkgrel=1
pkgdesc="GStreamer elements to use DSP algorithms."
arch=('arm' 'armv7h')
url="http://code.google.com/p/gst-dsp/"
license=('LGPL')
groups=()
depends=('gstreamer0.10')
makedepends=()
optdepends=('tidsp-binaries')
provides=('gst-dsp')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://gst-dsp.googlecode.com/files/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('f11bb1058e146be50ba9d37fd66ff54a')

build() {

  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make

}

package() {

  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

}
