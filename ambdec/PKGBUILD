#Maintainer: masutu <masutu dot arch at googlemail dot com>
#Contributor: masutu <masutu dot arch at googlemail dot com>
pkgname=ambdec
pkgver=0.4.4
pkgrel=1
pkgdesc='An Ambisonic decoder for up to 36 speakers using JACK.'
arch=('i686' 'x86_64')
url='http://kokkinizita.linuxaudio.org'
license=('GPL')
depends=('clthreads' 'clxclient' 'jack' 'libpng')
source=($url/linuxaudio/downloads/${pkgname}-${pkgver}.tar.bz2)
md5sums=('232930b86fba2c3ed4eda0568cd75ea1')

build() {
  cd "$srcdir/$pkgname-$pkgver/source"
  make || return 1
  make PREFIX=$pkgdir/usr install
}
