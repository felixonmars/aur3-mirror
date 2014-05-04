#Maintainer truh <truhgoj@truh.in>

pkgname=flappycoin-daemon
pkgdesc='Peer-to-peer network based digital currency (daemon)'
_binname=flappycoin
pkgver=3.0.0.0
pkgrel=1
_commit=6d172520ba00693ac33b9ca4db7bc614424cbe35
arch=('x86_64' 'i686')
url="http://flappycoin.info/"
license=('MIT')
provides=('flappycoin-daemon')

makedepends=('boost' 'miniupnpc')
depends=(boost-libs miniupnpc openssl)

source=('https://github.com/flappycoin-project/flappycoin/archive/6d172520ba00693ac33b9ca4db7bc614424cbe35.tar.gz'
        'flappycoind@.service')

md5sums=('a4bf91832d415e4c50ec9779a9a75e2b'
         'ce1dcfcb7f00d0668a30350d99530740')

## files & commands for building

prepare() {
    cd ${srcdir}/flappycoin-${_commit}/
}

build() {
    cd ${srcdir}/flappycoin-${_commit}/
    
    make -f makefile.unix -C src CXXFLAGS="$CXXFLAGS" USE_UPNP=1
}

package() {
    install -Dm644 flappycoind@.service "$pkgdir/usr/lib/systemd/system/flappycoind@.service"

    cd "${srcdir}/flappycoin-${_commit}/"
    install -Dm755 src/flappycoind "$pkgdir"/usr/bin/flappycoind
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
