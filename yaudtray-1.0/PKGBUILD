# Maintainer: Sergey Malkin <adresatt@gmail.com>
pkgname=yaudtray-1.0
pkgver=r10
pkgrel=1
pkgdesc="Small GUI tool for mounting and unmounting external drives with Udisks."
arch=('x86_64' 'i686')
url="http://sourceforge.net/projects/yaudtray/"
license=('GPL')
depends=('qt4' 'udisks')
source=(http://sourceforge.net/projects/yaudtray/files/${pkgname}-${pkgver}.tar.bz2/download)
md5sums=('378dc7326bf427a7455147303c9ab186')

build() {
cd "${srcdir}/${pkgname}-${pkgver}/"
qmake-qt4 PREFIX=/usr yaudtray.pro
make || return 1
}

package() {
cd "${srcdir}/${pkgname}-${pkgver}/"
make INSTALL_ROOT=${pkgdir} install || return 1
}
