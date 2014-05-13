# Maintainer: Joseph Knain <lilium180 at gmail dot com>
pkgname=parallax-git
_gitname='parallaxcoin'
pkgver=0.8.6.2
pkgrel=1
pkgdesc="Peer-to-peer network based digital currency."
arch=('i686' 'x86_64')
url="https://bitcointalk.org/index.php?topic=583660.0;all"
license=('MIT')
provides=(parallaxcoin)
conflicts=(parallaxcoin)
source=("git://github.com/parallaxcoin/parallaxcoin.git")
sha256sums=('SKIP')
depends=('qt4>=4.6' 'boost-libs>-1.46' 'miniupnpc>=1.6' 'qrencode>=3.4.3')
makedepends=('boost' 'automoc4' 'qrencode' 'miniupnpc' 'git')
pkgver() {
        cd "$srcdir/$_gitname"
        #Use tag of the last commit, but removing the prefix
        git describe --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}
build() {
        cd "${_gitname}"
        cd "$srcdir/$_gitname"

        # and make qt gui
        qmake-qt4 USE_QRCODE=1 USE_UPNP=1
        make

        # make parallaxcoin daemon
        cd "$srcdir/$_gitname/src"
        make $MAKEFLAGS -f makefile.unix
}

package() {
        # install parallaxcoin-qt client
        install -D -m755 "$srcdir/$_gitname/parallaxcoin-qt" "$pkgdir/usr/bin/parallaxcoin-qt"

        # install parallaxcoin daemon
        install -D -m755 "$srcdir/$_gitname/src/parallaxcoind" "$pkgdir/usr/bin/parallaxcoind"

        # install license
        install -D -m644 "$srcdir/$_gitname/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
