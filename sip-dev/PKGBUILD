# SIP (Dev): Installer: Arch
# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>

filename=sip
pkgname=${filename}-dev
pkgver=4.12
#pkgdate=f292793d6c99
pkgrel=1
pkgdesc="A tool that makes it easy to create Python bindings for C and C++ libraries.  This is the latest development snapshot."
arch=("i686" "x86_64")
url="http://www.riverbankcomputing.com/software/${filename}/"
license=(custom:"${filename}")
provides=("python-${filename}=${pkgver}")
depends=("python>=3" "python2-${filename}")
#conflicts=("${filename}" "${filename}4")
replaces=("${filename}4")
#options=(!emptydirs)
#install="${pkgname}.install"
source=(http://riverbankcomputing.com/static/Downloads/${filename}4/${filename}-${pkgver}.tar.gz)
#source=(http://riverbankcomputing.com/static/Downloads/${filename}4/${filename}-snapshot-${pkgver}-${pkgdate}.tar.gz)

build() {
	cd ${srcdir}/${filename}-${pkgver}
	#cd ${srcdir}/${filename}-snapshot-${pkgver}-${pkgdate}

	python3 configure.py || return 1
	make || return 1
}

package() {
	cd ${srcdir}/${filename}-${pkgver}
	#cd ${srcdir}/${filename}-snapshot-${pkgver}-${pkgdate}

	make DESTDIR=${pkgdir} install || return 1

	#install -m 644 -D LICENSE  ${pkgdir}/usr/share/licenses/${filename}/LICENSE || return 1

	# Removals
	rm ${pkgdir}/usr/bin/${filename}
	#mv ${pkgdir}/usr/bin/${filename} ${pkgdir}/usr/bin/${filename}-dev
}

sha1sums=('6ab3232d44afc2c58dc347103653313fda4e0d33')
