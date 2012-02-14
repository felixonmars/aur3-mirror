# Maintainer: Adrian Berriel <berriel[at]gmail[dot]com>

pkgname=kdeplasma-addons-applets-togglepanel-svn
pkgver=1239981
pkgrel=1
pkgdesc="Plasma applet to toggle visibility of a panel"
arch=('i686' 'x86_64')
url="http://websvn.kde.org/trunk/playground/base/plasma/applets/togglepanel/"
license=('LGPL')
depends=('kdebase-workspace')
makedepends=('automoc4' 'subversion' 'cmake')
provides=('kdeplasma-addons-applets-togglepanel')
conflicts=('kdeplasma-addons-applets-togglepanel')
source=()
md5sums=()
_svntrunk=svn://anonsvn.kde.org/home/kde/trunk/playground/base/plasma/applets/togglepanel
_svnmod=kdeplasma-addons-applets-togglepanel

build() {
	
	msg "Create or update code from Subversion site."
	cd ${srcdir}
	if [ -d ${_svnmod}/.svn ]; then
		(cd ${_svnmod} && svn up)
	else
		svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
	fi
	
	msg "SVN checkout done or server timeout"
	msg "Starting build ..."

	# copy to build directory
	cp -R ${srcdir}/${_svnmod} ${srcdir}/${_svnmod}-build
	cd ${_svnmod}-build
	
	cmake ${srcdir}/${_svnmod} -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RELEASE
	make
}
package() {
  cd ${srcdir}/${_svnmod}-build
	make DESTDIR=${pkgdir} install
	
	# remove the build directory
	rm -rf ${srcdir}/${_svnmod}-build
}
# vim:set ts=2 sw=2 et: