# Maintainer: Bastien Dejean <baskerville@lavabit.com>

pkgname=libunicodenames
pkgver=1.1.0_beta1
pkgrel=1
pkgdesc='A library for retrieving Unicode annotation data'
arch=('i686' 'x86_64')
url='https://bitbucket.org/sortsmill/libunicodenames'
license=('GPLv3')
depends=('python2')
provides=('libunicodenames')
conflicts=('libunicodenames')
source=("https://bitbucket.org/sortsmill/libunicodenames/downloads/libunicodenames-${pkgver}.tar.xz")
md5sums=('e49aafca94c80fe6e425d40ea407582f')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix=/usr PYTHON=python2
    make PREFIX=/usr
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
