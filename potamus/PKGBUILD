# Maintainer: Timothy Hoffmeyer <thoffmeyer0@gmail.com>

pkgname=potamus
pkgver=16
pkgrel=1
pkgdesc="Lightweight, intuitive GTK-based audio player with emphasis on high audio quality"
arch=('i686' 'x86_64')
url="http://offog.org/code/potamus.html"
license=('GPL')
depends=('audiofile' 'ffmpeg' 'jack' 'libao' 'libglade' 'libmad' 'libmodplug' 'libsamplerate')
install=potamus.install
source=(http://offog.org/files/$pkgname-$pkgver.tar.gz)
md5sums=('3f0a48de68224041f9ac1eb0115d08d0')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}
