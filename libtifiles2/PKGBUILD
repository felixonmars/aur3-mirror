# Contributor: Javier Aravena <javier@aravenas>
# Contributor: wandrian <wandrian@tuxfamily.org>

pkgname=libtifiles2
pkgver=1.1.3
pkgrel=1
pkgdesc="TI calculators libraries for Linux"
arch=('i686' 'x86_64')
url="http://lpg.ticalc.org/prj_tilp/"
license=('GPL')
depends=('libticonv2')
makedepends=('libticonv2')
conflicts=('libtifiles')
source=(http://www.ticalc.org/pub/unix/tilibs.tar.gz)
md5sums=('f2116f38dd1da06d302bf7335976d7c0')

build() {
    cd ${srcdir}/tilibs2
    tar -xvf ${pkgname}-${pkgver}.tar.bz2
    cd ${pkgname}-${pkgver}
    ./configure --prefix=/usr || return 1
    make || return 1
    make DESTDIR=${pkgdir} install || return 1
}
