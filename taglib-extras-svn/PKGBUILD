# $Id$
# Maintainer:

pkgname=taglib-extras-svn
pkgver=1021695
pkgrel=1
pkgdesc="Library for reading and editing the meta-data of several popular audio formats."
arch=('i686' 'x86_64')
url="http://www.jefferai.com/taglibs-extras"
license=('GPL2')
depends=('zlib' 'gcc-libs' 'taglib')
makedepends=('cmake>=2.6.2' 'pkgconfig' 'automoc4' 'subversion')
conflicts=('taglibs-extras')
source=()
md5sums=()

_svntrunk=svn://anonsvn.kde.org/home/kde/trunk/kdesupport/taglib-extras
_svnmod=taglib-extras-svn

build() {
	# start building
	cd ${srcdir}
	if [ -d ${_svnmod}/.svn ]; then
		(cd ${_svnmod} && svn up)
	else
		svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
	fi

	msg "SVN checkout done or server timeout"
	msg "Starting the build ..."

  cp -R ${srcdir}/${_svnmod} ${srcdir}/${_svnmod}-build
	cd ${srcdir}/${_svnmod}-build

	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
	make VERBOSE=1
}
package() {
  cd ${srcdir}/${_svnmod}-build
	make DESTDIR=${pkgdir} install

	# remove the build directory
  cd ${startdir}
	rm -rf ${srcdir}/${_svnmod}-build
}
# vim:set ts=2 sw=2 et: 
