# FirefoxQS: Installer: Arch
# Contributor: Chris Giles <Chris.G.27 (at) Gmail.com>
# Contributor: shamrok <szamrok@gmail.com>

basename=firefox
pkgname=${basename}qs
pkgver=0.1.3
pkgrel=1
pkgdesc="Firefox Quickstarter is a small Qt application that runs in the System Tray"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php?content=31014"
license=('GPL')
depends=("kdelibs3" "${basename}")
makedepends=('autoconf')

source=(http://dl.sourceforge.net/sourceforge/mozillaqs/${pkgname}-${pkgver}.tar.bz2)
sha1sums=('cac7db5627d895172cc3353308ff88067ad5751b')

build() {
	cd ${srcdir}/${pkgname}

	# Build
	./configure --prefix=/opt/kde --without-arts --disable-debug || return 1
	sed -i -e "s/run automake-1.9/run automake/" Makefile || return 1
	sed -i -e "s/run aclocal-1.9/run aclocal/" Makefile || return 1
	make || return 1
	make DESTDIR=${pkgdir} install || return 1
}
