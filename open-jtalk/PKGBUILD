# Maintainer: Peter Marheine <peter@taricorp.net>
pkgname=open-jtalk
pkgver=1.06
pkgrel=4
pkgdesc="Japanese text-to-speech system"
arch=('i686' 'x86_64')
url="http://open-jtalk.sourceforge.net/"
license=('BSD')
depends=('gcc-libs')
makedepends=('hts-engine>=1.07')
source=(http://downloads.sourceforge.net/$pkgname/open_jtalk-$pkgver.tar.gz)
md5sums=('102303f38e3405a7dae2f7e11026a023')

build() {
    cd "$srcdir/open_jtalk-$pkgver"
    ./configure --prefix=/usr --with-hts-engine-header-path=/usr/include --with-hts-engine-library-path=/usr/lib
    make
}

package() {
    cd "$srcdir/open_jtalk-$pkgver"
    make DESTDIR="$pkgdir" install
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
