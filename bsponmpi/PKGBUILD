#Mainteiner: Javier Fuentes <0xffaa.rm@gmail.com>
pkgname=bsponmpi
pkgver=0.2
pkgrel=2
pkgdesc="BSPonMPI is a plataform independent software library for developing parallel programs."
url="http://bsponmpi.sourceforge.net"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('openmpi' 'gcc')

source=("http://sourceforge.net/projects/${pkgname}/files/${pkgname}/0.2/${pkgname}-${pkgver}.tar.gz")
md5sums=("1adb7bdabb5d292148de000a16a05963")

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure --prefix=/usr/
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
