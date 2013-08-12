# QDevelop: Installer: Arch
# Contributor: Shaika-Dzari < shaikadzari at gmail dot com>
# Contributor: Zhukov Pavel <gelios@gmail.com>
# Contributor: Benjamin Kircher <benjamin.kircher@gmail.com>
# Maintainer: Chris Giles <Chris.G.27 (at) Gmail.com>
pkgname=qdevelop-svn
_svnname=qdevelop
pkgver=481
pkgrel=1
pkgdesc="A free and cross-platform IDE for Qt4"
arch=('any')
url="http://qdevelop.org/"
license='GPL2'
depends=('qt4')
makedepends=('subversion' 'unzip')
optdepends=('ctags: for code completion and class browser'
			'gdb: for debugging functionalities')

source=(${_svnname}::svn+http://qdevelop.googlecode.com/svn/trunk)
md5sums=('SKIP')

pkgver() {
	cd ${_svnname}
	svnversion | tr -d [A-z]
}

build() {
	cd ${_svnname}

	# Init
	#sed -i -e "s/free(allinherits)/delete [] allinherits/" src/QIComplete/tree.cpp || return 1

	# Build
	lrelease-qt4 QDevelop.pro || return 1
	qmake-qt4 || return 1
	make || return 1
}

package() {
	cd ${_svnname}
	make INSTALL_ROOT=${pkgdir} install || return 1

	# Desktop
	install -D ${startdir}/${_svnname}/${_svnname}.desktop ${pkgdir}/usr/share/applications/$_svnname}.desktop
	install -D resources/images/logo.png ${pkgdir}/usr/share/pixmaps/${_svnname}.png
}
