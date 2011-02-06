#Maintainer: masutu <masutu dot arch at googlemail dot com>
#Contributor: masutu <masutu dot arch at googlemail dot com>
pkgname=ambdec
pkgver=0.4.2
pkgrel=1
pkgdesc='An Ambisonic decoder for up to 36 speakers using JACK.'
arch=('i686' 'x86_64')
url='http://www.kokkinizita.net/linuxaudio/'
license=('GPL')
depends=('clxclient' 'jack' 'libpng')
source=('http://www.kokkinizita.net/linuxaudio/downloads/ambdec-0.4.2.tar.bz2' 'Makefile.patch')
md5sums=('2bebbc3317ba894d014803a1920330f9'
         'a7b77f01412f12f3b35504dc7637bf0f')
build() {
  cd "$srcdir/$pkgname-$pkgver/source"
  patch -p1 < ../../../Makefile.patch
  make || return 1
  make install
  mv temp/usr $pkgdir
}

# vim:set ts=2 sw=2 et:
