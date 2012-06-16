pkgname=openscenegraph28
pkgver=2.8.5
pkgrel=2
pkgdesc="An Open Source, high performance real-time graphics toolkit"
arch=('i686' 'x86_64')
license=('custom:OSGPL')
url="http://www.openscenegraph.org"
depends=('giflib' 'jasper' 'librsvg' 'xine-lib11201' 'curl' 'pth')
makedepends=('cmake' 'libvncserver')
optdepends=('libvncserver' 'gdal' 'openexr' 'poppler-glib')
conflicts=('openthreads' 'openscenegraph')
provides=('openthreads' 'openscenegraph')
source=(http://www.openscenegraph.org/downloads/stable_releases/OpenSceneGraph-$pkgver/source/OpenSceneGraph-$pkgver.zip
        ffmpeg.patch)
md5sums=('de844947d410726ba50ed07eb6319e6f'
         '65790bc6dbdedecf6bd3ee01ad22212a')


build() {
  PATH="/opt/kde/:/opt/kde/bin/:/opt/kde/include/:/opt/kde/lib/:/opt/kde/share/:$PATH"

  cd OpenSceneGraph-$pkgver

  patch -Np1 -i "$srcdir/ffmpeg.patch"

  [ $NOEXTRACT -eq 1 ] || cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  sed -i 's|#include <curl/types.h>|//#include <curl/types.h>|' src/osgPlugins/curl/ReaderWriterCURL.cpp
  make
}

package() {
  cd OpenSceneGraph-$pkgver
  make DESTDIR="$pkgdir" install
  install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  [ -d "$pkgdir/usr/lib64" ] && mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib" || true
}
