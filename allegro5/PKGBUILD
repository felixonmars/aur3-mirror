# Contributor: Nicolas Martyanoff <khaelin@gmail.com>

pkgname=allegro5
pkgver=5.0.0
pkgrel=1
pkgdesc="The last version of the Allegro multimedia library"
arch=(i686 x86_64)
url="http://alleg.sourceforge.net/"
license=('custom')
depends=('libsndfile' 'libjpeg' 'libxcursor' 'libgl' 'libpng' 'libvorbis' 'mesa')
makedepends=('cmake')
provides=('allegro5')
source=(http://kent.dl.sourceforge.net/sourceforge/alleg/allegro-$pkgver.tar.gz)
md5sums=('99ef472e2f99972d5e833794bf2f57bf')

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
