# maintainer=lordblackfox
pkgname=mozjs
pkgver=24.2.0
pkgrel=2
pkgdesc="Mozilla's latest javascript engine in a library (SpiderMonkey)"
url="http://www.mozilla.org/js/spidermonkey/"
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
depends=('nspr' 'autoconf2.13')
conflicts=('spidermonkey-1.7')
options=('!buildflags')
source=("https://ftp.mozilla.org/pub/mozilla.org/js/mozjs-${pkgver}.tar.bz2")
md5sums=('5db79c10e049a2dc117a6e6a3bc78a8e')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}/js/src
    autoconf-2.13
    ./configure --disable-tests --disable-debug --disable-debug-symbols --prefix=/usr
    make
}

package() {
    install -Dm644 \
        ${srcdir}/${pkgname}-${pkgver}/LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    cd ${srcdir}/${pkgname}-${pkgver}/js/src
    make DESTDIR="$pkgdir" install
}
