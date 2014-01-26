# Maintainer: Daniel Spies <daniel dot spies at fuceekay dot com>
# Contributor: Saro <the_shade14  at yahoo dot it>

pkgname=moto4lin-svn
_svnname=moto4lin
pkgver=r136
pkgrel=1
pkgdesc="Software to be used with Motorola telephones based on the P2K platform. It allows file system manipulations with Motorola phones."
arch=('x86_64' 'i686')
url="http://sourceforge.net/projects/moto4lin/"
license=('GPL2')
provides=('moto4lin')
conflicts=('moto4lin')
depends=('qt3>=3.3' 'libusb-compat')
optdepends=()
makedepends=('qt3>=3.3' 'gcc' 'libusb')
source=("svn+https://svn.code.sf.net/p/${_svnname}/code/trunk/${_svnname}")
sha256sums=('SKIP')
#install=moto4lin.install

pkgver() {
   cd "${srcdir}/${_svnname}"
   local ver="$(svnversion)"
   printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
   cd ${srcdir}/${_svnname}
   qmake-qt3 -o Makefile moto4lin.pro
   qmake-qt3 -o moto_ui/Makefile moto_ui/moto_ui.pro
   sed -i 's|$(QTDIR)/include|/usr/include/qt3|' Makefile
   sed -i 's|$(QTDIR)/include|/usr/include/qt3|' moto_ui/Makefile
   make UIC=/usr/bin/uic-qt3 MOC=/usr/bin/moc-qt3
}

package() {
   cd ${srcdir}/${_svnname}
   make INSTALL_ROOT="${pkgdir}/" install
}

