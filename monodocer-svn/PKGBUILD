# Contributor: Philipp Geyer <nistur@gmail.com>
pkgname=monodocer-svn
pkgver=87207
pkgrel=1
pkgdesc="The monodocer tool is used to maintain and update the documentation XML files (ECMA-styled documentation) for your project."
arch=('i686')
license=('GPL')
makedepends=('subversion' 'pkgconfig')
depends=('mono' 'mono-svn')
url="http://www.mono-project.com/Monodocer"
source=('')
md5sums=('')

_svntrunk=svn://anonsvn.mono-project.com/source/trunk/monodoc
_svnmod=monodoc
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

	./autogen.sh --prefix=/usr --with-moonlight
	make || return 1
	make DESTDIR=${startdir}/pkg/ install || return 1
	rm -rf ${startdir}/src/${_svnmod}-build
}
