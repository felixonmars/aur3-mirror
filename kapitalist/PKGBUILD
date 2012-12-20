# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>

pkgname=kapitalist
pkgver=0.4
pkgrel=2
pkgdesc="A Monopoly-like board game for 2-8 players.  This is the 'client' component."
arch=("i686" "x86_64")
url="http://kapitalist.sourceforge.net/"
license=("GPL")
depends=("kdelibs3>=3.5.9")
optdepends=("capitalist")
options=(!emptydirs)
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz)

build() {
	cd "${srcdir}"/${pkgname}-${pkgver}

	# Profiles
	source /etc/profile.d/kde3.sh
	source /etc/profile.d/qt3.sh

	# Variables
	#export LIBS=/opt/kde/lib

	#make -f Makefile.cvs
	./configure --prefix=/opt/kde --without-arts
	make
}

package() {
	cd "${srcdir}"/${pkgname}-${pkgver}

	make DESTDIR="${pkgdir}" install
}
