# Maintainer: Rasmus Steinke <rasi at xssn dot at>

pkgname=xininfo
pkgver=0.14.11
pkgrel=1
conflicts=('xininfo-git')
provides=('xininfo')
pkgdesc="Small helper program for monitor layouts."
arch=('i686' 'x86_64')
url='https://github.com/DaveDavenport/xininfo'
license=('GPL')
depends=('libx11' 'libxinerama')
options=(!strip)
install=xininfo-git.install
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)

build() {
    cd $pkgname-$pkgver
    make
}

package() {
    install -Dm755 ${srcdir}/${pkgname}-${pkgver}/build/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
md5sums=('6160b2063d95095b61a9613f4810150a')
