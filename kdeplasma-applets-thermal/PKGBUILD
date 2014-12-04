# Maintainer: Daniel Pena <trifling.github at gmail dot com> 

pkgname=kdeplasma-applets-thermal
_pkgname=thermal-plasma4
pkgver=1.2
pkgrel=2
pkgdesc="KDE 4.x plasma applet to monitor CPU, HDD and NVIDIA cards temperature."
arch=('i686' 'x86_64')
url="https://github.com/trifling/thermal-plasma4"
license=('LGPL')
depends=('kdebase-runtime' 'lm_sensors')
makedepends=('cmake' 'automoc4')
optdepends=('nvidia-utils: for NVIDIA cards support' 'hddtemp: for hard drive temperature support')
install=${pkgname}.install
source=( ${_pkgname}-${pkgver}.tar.gz::https://github.com/trifling/${_pkgname}/archive/v${pkgver}.tar.gz )
md5sums=('f77f234392dc048f1dbaa47ed6c6dd3b')

build() {
   cd "${srcdir}/${_pkgname}-${pkgver}"
   cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`
   make
}

package() {
   cd "${srcdir}/${_pkgname}-${pkgver}"
   make DESTDIR="${pkgdir}" install
}

