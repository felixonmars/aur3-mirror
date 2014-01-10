# Maintainer: Matt Harrison <matt@mistbyte.com>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: grimsock <lord.grimsock at gmail dot com>
# Contributor: Dieter Plaetinck <dieter@plaetinck.be>
# Contributor: Vladimir Chizhov <jagoterr@gmail.com>
# Contributor: Henry Tang <henryykt@gmail.com>

pkgname=phantomjs-1.8
pkgver=1.8.2
pkgrel=1
pkgdesc="Headless WebKit with JavaScript API Version 1.8 kept back for CasperJS stable"
url="http://www.phantomjs.org/"
license=('BSD' 'LGPL' 'MIT')
arch=('i686' 'x86_64')
depends=('gstreamer0.10-base' 'fontconfig' 'freetype2')
makedepends=('unzip')
conflicts=(phantomjs)
source=("https://github.com/ariya/phantomjs/tarball/${pkgver}")

build() {

  cd ariya-phantomjs-82cc201
  # workaround for https://github.com/ariya/phantomjs/issues/10635
  sed -i 's/QMAKE_LFLAGS+=-fuse-ld=gold/#QMAKE_LFLAGS+=-fuse-ld=gold/' src/qt/src/3rdparty/webkit/Source/common.pri

  ./build.sh --confirm --qt-config "-no-rpath"
}

package() {
  install -Dm755 "$srcdir/ariya-phantomjs-82cc201/bin/phantomjs" "$pkgdir/usr/bin/phantomjs"

  mkdir -p "$pkgdir/usr/share/$pkgname"
  cp -r "$srcdir/ariya-phantomjs-82cc201/examples" "$pkgdir/usr/share/$pkgname"/

  install -Dm644 "$srcdir/ariya-phantomjs-82cc201/LICENSE.BSD" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.BSD"
  install -Dm644 "$srcdir/ariya-phantomjs-82cc201/third-party.txt" "$pkgdir/usr/share/licenses/$pkgname/third-party.txt"
}

sha512sums=('f2db1db032bdc3d1d472e371af2586bb46c4217deb84edb140d5a4149c0892a7c57d9d736b69fbd65649fc808ae6db0934a0e8fb8d5c93baf790e7e6a23fc16d')