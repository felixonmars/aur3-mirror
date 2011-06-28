# Contributor: Nicolas Martyanoff <khaelin@gmail.com>
# Maintainer: Clayton G. Hobbs <clay@lakeserv.net>
pkgname=allegro5
pkgver=5.0.3
pkgrel=1
pkgdesc="The last version of the Allegro multimedia library"
arch=(i686 x86_64)
url="http://alleg.sourceforge.net/"
license=('custom')
depends=('libsndfile' 'libjpeg' 'libxcursor' 'libgl' 'libpng' 'libvorbis' 'mesa')
makedepends=('cmake')
provides=('allegro5')
source=(http://kent.dl.sourceforge.net/sourceforge/alleg/allegro-$pkgver.tar.gz)
md5sums=('159ca85ea51c0447d951d720b06079f2')

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
