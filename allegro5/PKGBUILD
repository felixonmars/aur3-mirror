# Contributor: Nicolas Martyanoff <khaelin@gmail.com>

pkgname=allegro5
pkgver=4.9.22
pkgrel=1
pkgdesc="The development version of the Allegro multimedia library"
arch=(i686 x86_64)
url="http://alleg.sourceforge.net/"
license=('custom')
depends=('libsndfile' 'libjpeg' 'libxcursor' 'libgl' 'libpng' 'libvorbis' 'mesa')
makedepends=('cmake')
provides=('allegro5')
source=(http://kent.dl.sourceforge.net/sourceforge/alleg/allegro-$pkgver.tar.gz)
md5sums=('4d427e748aef4fae9ecf34a517bc29bc')

build() {
  cd ${startdir}/src/allegro-$pkgver

  mkdir build
  cd build
  cmake -D CMAKE_INSTALL_PREFIX=/usr ..

  ccmake ..
  make || return 1
  make DESTDIR=${pkgdir} install

  install -D -m644 ../LICENSE.txt ${startdir}/pkg/usr/share/licenses/${pkgname}/LICENSE
}
