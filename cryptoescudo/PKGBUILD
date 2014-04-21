# Maintainer: Emanuel Fernandes <efernandes@tektorque.com>

pkgname=cryptoescudo
pkgver=1.0.3.0
pkgrel=1
pkgdesc="A Portuguese cryptocoin for the 21st century with Scrypt POW"
arch=('x86_64' 'i686')
url="http://cryptoescudo.org/"
license=('MIT')
provides=('cryptoescudo-qt' 'cryptoescudod')
conflicts=('cryptoescudo-qt' 'cryptoescudod')
depends=('qt4' 'miniupnpc' 'boost-libs')
makedepends=('boost' 'gcc' 'make')
source=("http://cryptoescudo.org/download/source.zip"
        "cryptoescudo.desktop")
md5sums=('020674091b67821dd84dd3fe68c199d0'
         'f7bf3293c9a774d9f46f5235f1e9ee5d')
install=cryptoescudo.install

## files & commands for building
_makefile_unix=makefile.unix
_qmake=qmake-qt4

build() {
   cd ${pkgname}/src
   # build cryptoescudod
   make USE_UPNP=1 USE_SSL=1 $MAKEFLAGS -f ${_makefile_unix} cryptoescudod
   # build cryptoescudo-qt
   cd ..
   ${_qmake}
   make $MAKEFLAGS
}

package() {
   install -Dm644 cryptoescudo.desktop ${pkgdir}/usr/share/applications/cryptoescudo.desktop
   cd ${pkgname}
   install -Dm755 cryptoescudo-qt "$pkgdir"/usr/bin/cryptoescudo-qt
   install -Dm755 src/cryptoescudod "$pkgdir"/usr/bin/cryptoescudod
   install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
   install -Dm644 src/qt/res/icons/bitcoin.png "$pkgdir"/usr/share/pixmaps/bitcoin256.png
}

