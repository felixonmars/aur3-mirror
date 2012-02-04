# Contributor: Philipp Geyer <nistur@gmail.com>
pkgname=olive-svn
pkgver=87201
pkgrel=1
pkgdesc="Olive is a set of add-on libraries for the Mono core that bring some of the new .NET APIs to Mono"
arch=('i686')
license=('GPL')
makedepends=('subversion' 'pkgconfig')
depends=('mono-svn')
url="http://www.mono-project.com/Olive"
source=('')
md5sums=('')

_svntrunk=svn://anonsvn.mono-project.com/source/trunk/olive
_svnmod=olive
build() {
	cd ${startdir}/src

	if [ -d ${_svnmod}/.svn ]; then
		(cd ${_svnmod} && svn up -r ${pkgver})
	else
		svn co ${_svntrunk} --config-dir ./ ${_svnmod} 
	fi
	msg "SVN checkout done or server timeout"
	msg "Starting make..."
	
	rm -rf ${startdir}/src/${_svnmod}-build
	cp -r ${_svnmod} ${_svnmod}-build
	cd ${startdir}/src/${_svnmod}-build

	./configure --prefix=/usr --with-moonlight
	make || return 1
	make DESTDIR=${startdir}/pkg/ install || return 1
	rm -rf ${startdir}/src/${_svnmod}-build
}
