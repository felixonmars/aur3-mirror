# Python-QScintilla (Dev): Installer: Arch
# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>

filename=qscintilla
pkgname=python-${filename}-dev
realname=QScintilla
pkgver=2.4.5
#pkgdate=90e3461f410f
pkgrel=1
pkgdesc="Python bindings for QScintilla2.  This is the latest development snapshot."
arch=("i686" "x86_64")
url="http://www.riverbankcomputing.co.uk/software/${filename}/"
license=("GPL3")
provides=("python-${filename}=${pkgver}")
depends=("pyqt-dev>=4.7" "${filename}-dev>=${pkgver}")
conflicts=("python-${filename}" "python-${filename}2")
replaces=("python-${filename}2")
options=(!emptydirs)
source=(http://riverbankcomputing.com/static/Downloads/${realname}2/${realname}-gpl-${pkgver}.tar.gz)
#source=(http://riverbankcomputing.com/static/Downloads/${realname}2/${realname}-gpl-snapshot-${pkgver}-${pkgdate}.tar.gz)

build() {
	cd ${srcdir}/${realname}-gpl-${pkgver}/Python
	#cd ${srcdir}/${realname}-gpl-snapshot-${pkgver}-${pkgdate}/Python

	python configure.py || return 1
	make || return 1
}

package() {
	cd ${srcdir}/${realname}-gpl-${pkgver}/Python
	#cd ${srcdir}/${realname}-gpl-snapshot-${pkgver}-${pkgdate}/Python

	make DESTDIR=${pkgdir} install || return 1
}

sha1sums=('2401c2214ba0377ad61855c0fac6f6c7c95801d6')
