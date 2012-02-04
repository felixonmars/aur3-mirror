# Contributor: Mathieu Clabaut <mathieu.clabaut@gmail.com>
# $Id$

pkgname=pycells-svn
pkgver=70
pkgrel=1
pkgdesc="Pycells is allows you to create classes, the instances of which have slots whose values are determined by a formula. Think of the slots as cells in a spreadsheet (get it?), and you've got the right idea"
url="http://pycells.pdxcb.net/"
license=('GPL')
depends=('python>=2.5'  )
makedepends=('subversion')
provides=('pycells')
arch=('i686' 'x86_64')
source=('patch-setup')
md5sums=('fec02e48557c89ee562de7a7c20b9e8c')


_svntrunk=http://pycells.pdxcb.net/svn/trunk
_svnmod=pycells
build() {

	cd ${startdir}/src
	svn co $_svntrunk $_svnmod

	msg "SVN checkout done or server timeout"
	msg "Starting make..."

	cp -R $_svnmod $_svnmod-build
	cd $_svnmod-build
	patch < ${startdir}/patch-setup || true

	python setup.py install --root $startdir/pkg || return 1
	mkdir -p ${pkgdir}/usr/share/pycells/
	cp -r demos docs tutorials ${pkgdir}/usr/share/pycells/
	chmod 644 -R  ${pkgdir}/usr/share/pycells/
	find  ${pkgdir}/usr/share/pycells/ -type d -exec chmod 755 \{\} \;
	find  ${pkgdir}/usr/share/pycells/ -type d -a -name .svn -exec rm -rf \{\} \; || true
}


