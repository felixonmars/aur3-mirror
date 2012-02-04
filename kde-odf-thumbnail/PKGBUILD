pkgname=kde-odf-thumbnail
pkgver=1.0.0
pkgrel=1
pkgdesc="KDE thumbnail-plugin to generate thumbnails for ODF documents in Dolphin/Konqueror"
arch=('i686' 'x86_64')
url="http://kenai.com/projects/kde-odf-thumbnail"
license=('LGPL-2.1')
depends=('qt' 'kdebase-workspace')
makedepends=('cmake' 'automoc4')
install=$pkgname.install
source=(http://kenai.com/projects/kde-odf-thumbnail/downloads/download/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('edf694939f4b5d5e97c3fe2f91e7cec3')

build() {
  cd $srcdir/$pkgname-$pkgver
  rm -rf build && mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir/" install
  install -Dm644 $srcdir/$pkgname-$pkgver/LICENSE $pkgdir/usr/share/licenses/$pkgname/COPYING
}

# vim:set ts=2 sw=2 et:
