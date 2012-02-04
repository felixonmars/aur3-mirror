# Contributor: Javier Aravena <javier@aravenas.com>
# Contributor: wandrian <wandrian@tuxfamily.org>

pkgname=libticalcs2
pkgver=1.1.5
pkgrel=1
pkgdesc="TI calculators libraries for Linux"
arch=('i686' 'x86_64')
url="http://lpg.ticalc.org/prj_tilp/"
license=('GPL')
depends=('libticables2' 'libticonv2' 'libtifiles2')
makedepends=('libticables2' 'libticonv2' 'libtifiles2')
conflicts=('libticalcs')
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

