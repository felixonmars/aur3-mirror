# Maintainer: stalker_exe <stalkerexe8@gmail.com>
pkgname=quanta
pkgver=4.7.4
pkgrel=1
pkgdesc="Quanta Plus is a highly stable and feature rich web development environment"
arch=("i686" "x86_64")
url="http://${pkgname}.kdewebdev.org"
license=("GPL" "LGPL" "FDL")
depends=("kdelibs3" "kdepimlibs")
makedepends=("pkg-config" "cmake" "automoc4" "boost")
sha1sums=('1e37e877d4f5ec8f6dcd05e828b4a8f0fd743d2c')
options=(docs)
#source=(ftp://ftp.kde.org/pub/kde/stable/${pkgver}/src/kdewebdev-${pkgver}.tar.bz2)
source=(http://mirror.internode.on.net/pub/kde/stable/${pkgver}/src/kdewebdev-${pkgver}.tar.bz2)

build() {
	cd ${srcdir}/kdewebdev-${pkgver}

	# Environment
	. /etc/profile.d/qt3.sh
	. /etc/profile.d/kde3.sh

	# Build
	#./configure --prefix=/opt/kde \
	#	--without-arts \
	#	--enable-final \
	#	--enable-gcc-hidden-visibility \
	#	--without-kommander || return 1
 cmake ${srcdir}/kdewebdev-${pkgver}
 make || return 1
 	#cd ${pkgname}
 	make DESTDIR=${pkgdir} install || return 1
}


