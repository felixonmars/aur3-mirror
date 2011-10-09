# Maintainer: Clayton G. Hobbs <clay@lakeserv.net>
pkgname=allegro5
pkgver=5.0.4
pkgrel=3
pkgdesc="The latest version of the Allegro multimedia library"
arch=(i686 x86_64)
url="http://alleg.sourceforge.net/"
license=('custom')
depends=('libsndfile' 'libjpeg' 'libxcursor' 'libgl' 'libpng' 'libvorbis' 'mesa')
makedepends=('cmake')
provides=('allegro5')
source=(http://downloads.sourceforge.net/project/alleg/allegro/$pkgver/allegro-$pkgver.tar.gz)
md5sums=('e2e314ee7116c7efddd0497d6c885e46')

build() {
  cd "$srcdir/allegro-$pkgver"
  if [ ! -d build ]; then
    mkdir build
  fi
  cd build

  cmake -D CMAKE_INSTALL_PREFIX=/usr -D CMAKE_BUILD_TYPE=Release ..

  cmake ..
  make || return 1
}

package() {
  cd "$srcdir/allegro-$pkgver/build"
  if [ ! -f LICENSE.txt ]; then
    cp ../LICENSE.txt .
  fi

  make DESTDIR="$pkgdir/" install

  install -D -m644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
