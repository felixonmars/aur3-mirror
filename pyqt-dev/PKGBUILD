# PyQt (Dev): Installer: Arch
# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>

filename=pyqt
pkgname=${filename}-dev
realname=PyQt
pkgver=4.8.2
#pkgdate=620cc57dc977
pkgrel=1
pkgdesc="A set of Python bindings for the Qt toolkit.  This is the latest development snapshot."
arch=("i686" "x86_64")
url="http://www.riverbankcomputing.co.uk/software/${filename}/"
license=("GPL3")
provides=("python-qt=${pkgver}")
depends=("sip-dev" "python2-qt")
makedepends=("phonon" "python-opengl" "qt-assistant-compat")
optdepends=("phonon: enable audio and video in PyQt applications"
	"python-opengl: enable OpenGL 3D graphics in PyQt applications"
	"qscintilla: QScintilla API"
	"qt-assistant-compat: add PyQt online help in Qt Assistant")
#conflicts=("${filename}" "${filename}4")
replaces=("${filename}4")
#options=(!emptydirs)
source=(http://www.riverbankcomputing.co.uk/static/Downloads/${realname}4/${realname}-x11-gpl-${pkgver}.tar.gz)
#source=(http://www.riverbankcomputing.co.uk/static/Downloads/${realname}4/${realname}-x11-gpl-snapshot-${pkgver}-${pkgdate}.tar.gz)

build() {
	cd ${srcdir}/${realname}-x11-gpl-${pkgver}
	#cd ${srcdir}/${realname}-x11-gpl-snapshot-${pkgver}-${pkgdate}

	python3 configure.py --confirm-license --qsci-api || return 1
	#python3 configure.py --confirm-license -v /usr/share/sip --qsci-api || return 1

	# Thanks Gerardo for the rpath fix
	find -name 'Makefile' | xargs sed -i 's|-Wl,-rpath,/usr/lib||g;s|-Wl,-rpath,.* ||g' || return 1

	make || return 1
}

package() {
	cd ${srcdir}/${realname}-x11-gpl-${pkgver}
	#cd ${srcdir}/${realname}-x11-gpl-snapshot-${pkgver}-${pkgdate}

	# INSTALL_ROOT is needed for the QtDesigner module, the other Makefiles use DESTDIR
	make DESTDIR="${pkgdir}" INSTALL_ROOT="${pkgdir}" install || return 1

	# Removals
	rm ${pkgdir}/usr/bin/{pylupdate4,pyrcc4,pyuic4}
	rm ${pkgdir}/usr/lib/qt/plugins/designer/libpythonplugin.so
	rm ${pkgdir}/usr/share/qt/qsci/api/python/PyQt4.api
}

sha1sums=('fd26aed89a6032c85a553bfd5228280ac982b85c')
