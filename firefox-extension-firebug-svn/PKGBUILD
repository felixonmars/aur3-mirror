# Contributer: N30N <archlinux@alunamation.com>

pkgname=firefox-extension-firebug-svn
pkgver=788
pkgrel=2
pkgdesc="SVN version of the firebug extention for firefox"
url="http://getfirebug.com/"
license="BSD"
arch=("i686" "x86_64")
depends=("firefox>=3.0")
makedepends=("subversion" "apache-ant")
provides=("firefox-extension-firebug")
source=()
md5sums=()

_svntrunk="http://fbug.googlecode.com/svn/branches/firebug1.2/"
_svnmod="firebug"

build() {
	cd ${srcdir}
	msg "Connecting to firebug SVN server......."
	if [ -d ${_cvsmod}/.svn ]; then
		(cd ${_cvsmod} && svn update -r ${pkgver})
	else
		svn co ${_svntrunk} ${_svnmod} --config-dir ./ -r ${pkgver}
	fi

	if [ -e ${_svnmod}/dist ]; then
		rm -rf ${_svnmod}/{dist,build}
	fi

	msg "Starting build process."
	(cd ${_svnmod} && ant) || return 1

	mkdir -p ${pkgdir}/usr/lib/firefox-3.0/extensions
	unzip ${_svnmod}/dist/firebug*.xpi -d ${pkgdir}/usr/lib/firefox-3.0/extensions/firebug@software.joehewitt.com

	msg "If you'd prefer the package in xpi format, it can be found in the following directory"
	msg2 "${srcdir}/${_svnmod}/dist"
}
