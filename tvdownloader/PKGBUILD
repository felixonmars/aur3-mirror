# Maintainer: wido <widomaker2k7@gmail.com>

pkgname=tvdownloader
pkgver=0.7.2
pkgrel=4
pkgdesc="Software to retreive podcasts and videos from French websites."
url="http://code.google.com/p/tvdownloader/"
depends=('msdl' 'python2-crypto' 'python2' 'python2-qt' 'rtmpdump' 'python2-mechanize')
license=('GPL2')
arch=('any')
source=(http://${pkgname}.googlecode.com/files/${pkgname}-${pkgver}.tar.gz)
md5sums=('bef8fb8c0bda2ca23c340437becc5521')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    sed -i 's/python/python2.7/' Makefile
    make
}
package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    make PREFIX=$pkgdir/usr install
}
