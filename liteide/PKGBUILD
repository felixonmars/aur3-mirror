# Maintainer: Harley Laue <losinggeneration@gmail.com>
pkgname=liteide
pkgver=x19
pkgrel=1
pkgdesc="A simple, open source, cross-platform IDE"
arch=('x86_64')
url="http://code.google.com/p/liteide"
license=('LGPL')
depends=('qt4' 'qjson')
optdepends=('qtwebkit: html render used if installed')
makedepends=('go' 'qtwebkit')
provides=(liteide)
conflicts=(liteide-hg)
source=(https://github.com/visualfc/${pkgname}/archive/${pkgver}.zip
        qjson.patch
        qt4.patch
)
md5sums=('17a95d76cb1d53583c6e24eb9a132201'
         'e04c45a212338ed2f2b0ef8d2b55e1af'
         '935b6457f79af1e1f701d58cdb1c8ada')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"

  patch -p1 < "$srcdir/qjson.patch"
  patch -p1 < "$srcdir/qt4.patch"

  cd build
  QTDIR=/usr sh ./build_linux.sh
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}/build/liteide"

  mv bin/*.so* lib
  rm -rf lib/liteide/*.so*

  mkdir -p "$pkgdir/usr"
  cp -r bin lib share "$pkgdir/usr"
  cp "LICENSE.LGPL" "LGPL_EXCEPTION.TXT" "../../README.md" "$pkgdir/usr/share/$pkgname"
}

# vim:set ts=2 sw=2 et:
md5sums=('f921f74d122d0d88e328e54ee2e3c143'
         'e04c45a212338ed2f2b0ef8d2b55e1af'
         '935b6457f79af1e1f701d58cdb1c8ada')
