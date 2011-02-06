# Kasablanca: Installer: Arch
# Contributor: Chris Giles <Chris.G.27 (at) Gmail.com>
# Contributor: Vinay S Shastry <vinayshastry at gmail.com>

pkgname=kasablanca
pkgver=0.4.0.2
pkgrel=2
pkgdesc="An ftp client, written in c++, using the KDE3 libraries, supporting encryption, FXP, site bookmarks and queued transfers"
arch=("i686" "x86_64")
url="http://${pkgname}.berlios.de/"
license=("GPL")
depends=("kdelibs3")
makedepends=("gcc")
options=("!emptydirs")

source=(http://download.berlios.de/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha1sums=('62eb1d53ed3d622db70eda94cd9279b448ca4c68')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}

	# Profiles
	source /etc/profile.d/kde3.sh
	source /etc/profile.d/qt3.sh

	# Build
	./configure --prefix=`kde-config --prefix` --without-arts || return 1
	make || return 1
	make DESTDIR=${pkgdir} install || return 1
}
