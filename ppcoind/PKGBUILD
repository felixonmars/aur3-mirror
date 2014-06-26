# Maintainer: Jashandeep Sohi <jashandeep.s.sohi@gmail.com>

pkgname='ppcoind'
pkgver=v0.4.0ppc.r3.g1f058b6
pkgrel=1
pkgdesc='Official CLI implementation of Peercoin, the sustainable and secure cryptocurrency alternative to Bitcoin.'
url='http://peercoin.net/'
license=('MIT')
install='ppcoind.install'
source=($pkgname'::git+https://github.com/ppcoin/ppcoin.git'
        'ppcoind.service'
        'ppcoind.conf'
        'ppcoind.tmpfiles')
md5sums=('SKIP'
         '82b6a69bb733d2e04e8648852b193117'
         'b6e63e82204c7284ed015c53960d47e6'
         'b0fbd436d73e454d949c76d938183274')
arch=('i686' 'x86_64')
makedepends=('boost' 'miniupnpc')
depends=('boost-libs' 'miniupnpc' 'openssl')

pkgver() {
 cd "$srcdir/$pkgname"
 git describe --always | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
 cd "$srcdir/$pkgname"
 
 # make ppcoind
 make -f makefile.unix -C src  CXXFLAGS="$CXXFLAGS"
 
}

package() {
 cd "$srcdir"
 install -Dm755 "$pkgname/src/ppcoind" "$pkgdir/usr/bin/ppcoind"
 install -Dm640 "ppcoind.conf" "$pkgdir/etc/ppcoind/ppcoind.conf"
 install -Dm644 "ppcoind.service" "$pkgdir/usr/lib/systemd/system/ppcoind.service"
 install -Dm644 "ppcoind.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/ppcoind.conf"
 install -Dm644 "$pkgname/COPYING" "$pkgdir/usr/share/licenses/ppcoind/COPYING"
}
