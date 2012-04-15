# Maintainer: laloch <laloch@atlas.cz>
pkgname=qt-gstreamer
pkgver=0.10.2
pkgrel=1
pkgdesc="Qt bindings for GStreamer"
arch=('i686' 'x86_64')
url="http://gstreamer.freedesktop.org/modules/qt-gstreamer.html"
license=('LGPL2.1')
depends=('qt' 'gstreamer0.10-base')
makedepends=('cmake' 'automoc4' 'boost' 'flex' 'bison')
optdepends=('libgles: required for OpenGLES rendering support in qtvideosink (embedded only)')
source=("http://cgit.freedesktop.org/gstreamer/$pkgname/snapshot/RELEASE-$pkgver.tar.bz2")
md5sums=('f91ca289a75eb65014aa2ca3de71686b')

build() {
  rm -rf "$srcdir/$pkgname-build"
  mkdir "$srcdir/$pkgname-build"
  cd "$srcdir/$pkgname-build"

  cmake "$srcdir/RELEASE-$pkgver" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DQTGSTREAMER_EXAMPLES=OFF \
    -DQTGSTREAMER_TESTS=OFF
  make
}

package() {
  cd "$srcdir/$pkgname-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
