# Maintainer: ewhal4 <ewhal4 at live dot com>
pkgname=feathercoin-git
pkgver=v0.8.7.1.r0.g1b7a5e9
pkgrel=1
pkgdesc="Feathercoin is a peer-to-peer network based digital currency."
arch=('i686' 'x86_64')
url="http://www.feathercoin.com/"
license=('MIT')
depends=('qt4>=4.6' 'boost-libs>=1.46' 'miniupnpc>=1.6')
makedepends=('git' 'boost' 'gcc' 'make' 'automoc4')
provides=('feathercoin')
conflicts=('feathercoin')
install="$pkgname.install"
source=("$pkgname::git+https://github.com/FeatherCoin/FeatherCoin.git" feathercoin.desktop feathercoin.png)
sha1sums=('SKIP' 'c7a164f4805374465eb5c3f265581bc40b91843a' '8d4cbf68fb6d66ed37e54bb1133aa00e43373e87')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
build() {
    cd "$srcdir/$pkgname"
    qmake-qt4
    make
    cd src
    make $MAKEFLAGS -f makefile.unix feathercoind
}

package() {
    mkdir -p $pkgdir/usr/bin
    cd "$srcdir/$pkgname"
    install -D -m755 feathercoin-qt $pkgdir/usr/bin
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/feathercoin-git/LICENSE"
    install -D -m755 src/feathercoind "$pkgdir/usr/bin"
    install -D -m644 $srcdir/feathercoin.desktop "$pkgdir"/usr/share/applications/feathercoin.desktop
    install -D -m644 $srcdir/feathercoin.png "$pkgdir/usr/share/pixmaps/feathercoin.png"
}
