# Contributor: Frikilinux <frikilinux at frikilinux.com.ar>

pkgname=ftpmonitor-plasmoid
_pkgname=ftpmonitor
pkgver=1.1
pkgrel=1
pkgdesc="Ftpmonitor is simple plasmoid for kde4, which monitors incoming connections to ftp daemons."
url="http://ftpmonitor.googlecode.com/"
license="GPL"
arch=('i686' 'x86_64')
depends=('kdebase-runtime>4.2')
makedepends=('automoc4')
conflicts=()
provides=()
source=(http://ftpmonitor.googlecode.com/files/${_pkgname}-${pkgver}.tar.bz2)
md5sums=('4d26e9502b5d1ccd21ee25afb5094430')

build() {
   cd ${srcdir}/${_pkgname}-${pkgver}

    cmake -DCMAKE_INSTALL_PREFIX=/usr || return 1
    make || return 1
    make DESTDIR=${pkgdir} install || return 1
}

