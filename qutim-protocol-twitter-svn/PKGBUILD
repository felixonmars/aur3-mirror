# Contributor: Borislav Gerassimov (slimmer) <borislavba (at) gmail.com>
pkgname=qutim-protocol-twitter-svn
pkgver=4
pkgrel=5
pkgdesc="Adds support for the Twitter protocol to Qutim. SVN version"
arch=('i686' 'x86_64')
url="http://qutim.org"
license=('GPL')
depends=('qutim-svn')
makedepends=('subversion' 'gcc' 'make')
provides=('qutim-plugin-twitter-svn')
replaces=('qutim-plugin-twitter-svn')
conflicts=('qutim-plugin-twitter-svn')

_svnmod=qutim-twitter
_svntrunk=https://boiler.co.ru/svn/${_svnmod}

build() {
msg "Downloading from ${_svntrunk} ..."
	cd ${srcdir}
	if [ -d ${_svnmod}/.svn ]; then
		(cd ${_svnmod} && svn up -r ${pkgver})
	else
		svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
	fi
	msg2 "SVN checkout done or server timeout"

msg "Creating temporary build directory..."
	rm -Rf ${_svnmod}-build
	cp -r ${_svnmod} ${_svnmod}-build
	cd ${srcdir}/${_svnmod}-build

msg "Building and installing..."
	qmake || return 1
	make || return 1

	cd ${srcdir}
	install -Dm 644 ${_svnmod}-build/libtwitter.so \
			${pkgdir}/usr/lib/qutim/libtwitter.so || return 1

msg "Removing temporary files..."
	rm -Rf ${_svnmod}-build
}
