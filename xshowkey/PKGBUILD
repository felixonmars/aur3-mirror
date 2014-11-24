# Contributor: portix <portix@gmx.net>

pkgname=xshowkey
pkgver=0.2
pkgrel=1
pkgdesc="Print X11 keycodes and keysym names" 
url="http://bitbucket.org/portix/xshowkey" 
arch=('i686' 'x86_64')
license=('GPL')
depends=('libx11')
source=(https://bitbucket.org/portix/xshowkey/downloads/${pkgname}-${pkgver}.tar.gz)
md5sums=('30942768b346e86a99a0e18cef368557')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make 
}
package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install 
}
