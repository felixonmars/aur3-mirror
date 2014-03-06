 
# Contributor: said

pkgname=lugdulov
pkgver=0.6.2
pkgrel=1
pkgdesc="Find a bike quickly in your city, with map and geolocalisation support"
arch=('i686' 'x86_64')
url="http://xf.iksaif.net/dev/lugdulov.html"
license=('GPL')
depends=('qjson')
makedepends=('cmake')
source=(http://xf.iksaif.net/dev/lugdulov/$pkgname-$pkgver.tar.gz)
md5sums=('d3949c12339fa58cf634856cc1818d83')

build() {
    cd  ${startdir}/src/${pkgname}-${pkgver}
    cmake . -DCMAKE_INSTALL_PREFIX=/${pkgdir}/usr || return 1
    make || return 1   
}
package() {
    cd  ${startdir}/src/${pkgname}-${pkgver}
    make INSTALL_ROOT=${pkgdir} install || return 1 
}
