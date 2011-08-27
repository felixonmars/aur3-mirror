# InstallJammer: Installer: Arch
# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>

pkgname=installjammer
pkgver=1.2.15
pkgrel=1
pkgdesc="A multiplatform GUI installer, built upon Tcl/Tk"
arch=("any")
url="http://www.${pkgname}.com/"
license=("GPL")
depends=("tk")
makedepends=()
optdepends=()
options=(!emptydirs)
source=(http://downloads.${pkgname}.com/${pkgname}/1.2/${pkgname}-${pkgver}.tar.gz)

build() {
	/bin/true
}

package() {
	cd ${srcdir}

	# Directories
	install -d ${pkgdir}/usr/{share/applications,bin}/

	# Application
	cp -r ${pkgname} ${pkgdir}/usr/share/
	#./${realname}-${pkgver}-Linux-x86-Install --mode silent --prefix ${pkgdir}/usr/share/${pkgname}/ || return 1

	# Binaries
	#ln -s /usr/share/${pkgname}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
	cp ${startdir}/extra/${pkgname} ${pkgdir}/usr/bin/

	# Desktop
	cp ${startdir}/extra/*.desktop ${pkgdir}/usr/share/applications/
}

sha1sums=('8147db42300d49c38a0046a438443a66384fa8ff')
