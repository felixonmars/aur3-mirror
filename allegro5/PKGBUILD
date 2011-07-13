# Maintainer: Clayton G. Hobbs <clay@lakeserv.net>
pkgname=allegro5
pkgver=5.0.3
pkgrel=2
pkgdesc="The last version of the Allegro multimedia library"
arch=(i686 x86_64)
url="http://alleg.sourceforge.net/"
license=('custom')
depends=('libsndfile' 'libjpeg' 'libxcursor' 'libgl' 'libpng' 'libvorbis' 'mesa')
makedepends=('cmake')
provides=('allegro5')
source=(http://downloads.sourceforge.net/project/alleg/allegro/$pkgver/allegro-$pkgver.tar.gz)
md5sums=('159ca85ea51c0447d951d720b06079f2')

build() {
  cd "$srcdir/allegro-$pkgver"

  cmake -D CMAKE_INSTALL_PREFIX=/usr .

  ccmake .
  make || return 1
}

package() {
  cd "$srcdir/allegro-$pkgver"

  make DESTDIR="$pkgdir/" install

  install -D -m644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
