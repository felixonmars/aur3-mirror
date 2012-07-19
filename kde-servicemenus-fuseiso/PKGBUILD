# Mantainerr: Michał "Dinth" Gawroński <dinth1906@gmail.com>

pkgname=kde-servicemenus-fuseiso
_pkgname=kde-service-menu-fuseiso
pkgver=0.2
pkgrel=1
pkgdesc="ISO mount/unmount service menu for KDE4, using FUSEISO."
arch=('i686' 'x86_64')
url="http://awen.dk/dist/${_pkgname}/"
license=('GPL2')
depends=('kdebase-workspace' 'fuseiso')
makedepends=('cmake' 'automoc4')
conflicts=('servicemenu-fuseiso-kde4')
replaces=('servicemenu-fuseiso-kde4')
source=("http://awen.dk/dist/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
install=${pkgname}.install
md5sums=('21b8ab1211c5ee4587769aae9507371a')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    cmake . -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
