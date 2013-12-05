# Maintainer: Daniel Spies <daniel dot spies at fuceekay dot com>

pkgname=primecoin-qt
_gitname=primecoin
pkgver=0.1.2
pkgrel=0
pkgdesc="Cryptocurrency with Scientific Computing Proof-of-Work (Prime)"
arch=('x86_64' 'i686')
url="http://www.primecoin.org/"
license=('MIT')
provides=('primecoin-qt' 'primecoind')
conflicts=('primecoind')
depends=('qt4' 'miniupnpc' 'boost-libs')
makedepends=('boost' 'gcc' 'make')
source=("http://downloads.sourceforge.net/project/${_gitname}/${pkgver}/${_gitname}-${pkgver}-linux.tar.gz?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fprimecoin%2Ffiles%2F&ts=1386124079"
        "primecoin.desktop")
sha256sums=('d0f3c6a91b4d505f25e9284bcca85e420cf09d0e6cf71e5a001b7e1367ef46d0'
            'd48546c4aab0a1f42fad2aa2f2069d20b4ab85782703927ca6a4bd0846d6348f') 
install=primecoin.install

## files & commands for building
_makefile_unix=makefile.unix
_qmake=qmake-qt4

build() {
   cd ${_gitname}-${pkgver}-linux/src/src
   # build primecoind
   make USE_UPNP=1 USE_SSL=1 $MAKEFLAGS -f ${_makefile_unix} primecoind
   # build primecoin-qt
   cd ..
   ${_qmake}
   make $MAKEFLAGS
}

package() {
   install -Dm644 primecoin.desktop ${pkgdir}/usr/share/applications/primecoin.desktop
   cd ${_gitname}-${pkgver}-linux/src
   install -Dm755 primecoin-qt "$pkgdir"/usr/bin/primecoin-qt
   install -Dm755 src/primecoind "$pkgdir"/usr/bin/primecoind
   install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
   install -Dm644 src/qt/res/icons/primecoin.png "$pkgdir"/usr/share/pixmaps/primecoin256.png
}

