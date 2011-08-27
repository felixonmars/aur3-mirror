# KlamAV: Installer: Arch
# Contributor: Chris Giles <Chris.G.27 (at) Gmail.com>
# Contributor: Darwin Bautista <djclue917@gmail.com>
# Contributor: Darwin Bautista <djclue917@gmail.com>
# Contributor: BlackEagle <ike.devolder@scarlet.be>
# Maintainer: Nathan Owe <ndowens04+AUR at gmail.com>

pkgname=klamav
pkgver=0.46
pkgrel=5
pkgdesc="An anti-virus manager for KDE that's based on the ClamAV scanning engine"
arch=("i686" "x86_64")
url="http://${pkgname}.sourceforge.net/"
license=("GPL")
depends=("clamav" "kdelibs3")
optdepends=("dazuko: Allows online virus scanning")
options=("!libtool")

source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}-source.tar.gz)
sha1sums=('37fd30c67d8e7c0b90a308dfc9960154c91a0e88')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}-source/${pkgname}-${pkgver}/

	# Directories
	#install -d ${pkgdir}/opt/kde/share/doc/HTML/en/${pkgname}02/common || return 1

	# Config
	source /etc/profile.d/kde3.sh || return 1
	#sed -i 's|RPATH||g' configure || return 1

	# Build
	./configure --prefix=/opt/kde --without-arts || return 1
	#./configure --prefix=/opt/kde --without-arts --disable-rpath || return 1
	make || return 1
	make libdir=${pkgdir}/usr/lib DESTDIR=${pkgdir}/ install || return 1
}
