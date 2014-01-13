# Maintainer: Zifei Tong <soariez@gmail.com>

pkgname=vtable-dumper
pkgver=1.0
pkgrel=1
pkgdesc="A tool to list content of virtual tables in a C++ shared library"
url="https://github.com/lvc/vtable-dumper"
license=('GPL')
depends=('elfutils')
arch=('i686' 'x86_64')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/lvc/vtable-dumper/archive/${pkgver}.tar.gz)
md5sums=('888d9e207a8b0cd324f89b05c2e4feea')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    mkdir -p "${pkgdir}/usr"
    make install prefix="${pkgdir}/usr"
}
