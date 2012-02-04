# PKGBUILD modified from the one for openscengraph
# Maintainer: hauptmech <hauptmech@gmail.com>

# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Hans Janssen <janserv@gmail.com>
# Contributor: my64 <packages@obordes.com>
# Contributor: Colin Pitrat <colin.pitrat@gmail.com>

pkgname=openscenegraph-osgqt
pkgver=3.0.1
pkgrel=1
pkgdesc="Provides libosgQt for OpenSceneGraph, an Open Source, high performance real-time graphics toolkit"
arch=('i686' 'x86_64')
license=('custom:OSGPL')
url="http://www.openscenegraph.org"
depends=('giflib' 'jasper' 'librsvg' 'xine-lib' 'curl' 'pth' 'qt')
makedepends=('cmake' 'libvncserver')
optdepends=('libvncserver' 'gdal' 'openexr' 'poppler-glib')
conflicts=()
provides=()
source=(http://www.openscenegraph.org/downloads/stable_releases/OpenSceneGraph-$pkgver/source/OpenSceneGraph-$pkgver.zip)
#source=("http://www.openscenegraph.org/downloads/stable_releases/OpenSceneGraph-3.0/source/OpenSceneGraph-$pkgver.zip")
md5sums=('c43a25d023e635c3566b2083d8e6d956')

build() {
  cd OpenSceneGraph-$pkgver
  sed -i 's|#include <curl/types.h>|//#include <curl/types.h>|' src/osgPlugins/curl/ReaderWriterCURL.cpp
  mkdir build
  cd build
  [ $NOEXTRACT -eq 1 ] || cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make osgQt
}

package() {
  cd OpenSceneGraph-$pkgver/build/src/osgQt
  make DESTDIR="$pkgdir" install
  install -D -m644 $srcdir/OpenSceneGraph-$pkgver/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  [ -d "$pkgdir/usr/lib64" ] && mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib" || true
}
