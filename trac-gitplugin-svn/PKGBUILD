# Contributor: Alper KANAT <alperkanat@raptiye.org>

pkgname="trac-gitplugin-svn"
pkgver=7755
pkgrel=1
pkgdesc="A plugin to make GIT available as a version system backend."
url="http://trac-hacks.org/wiki/GitPlugin"
arch=('i686' 'x86_64')
license=('GPL2')
makedepends=("python2" "python2-distribute")
depends=("git" "python2" "trac")
conflicts=("trac-gitplugin")
provides=("trac-gitplugin")
install=("gitplugin.install")
source=()
md5sums=()

_svntrunk="http://trac-hacks.org/svn/gitplugin/0.11/"
_svnmod="gitplugin"

build() {
	cd ${srcdir}
	msg "Connecting to gitplugin svn server..."

	if [ -d $_svnmod/.svn ]; then
		(cd $_svnmod && svn up -r $pkgver)
	else
		svn co $_svntrunk -r $pkgver $_svnmod
	fi

	msg "SVN checkout done or server timeout"
	msg "Starting make..."

	cd ${srcdir}/${_svnmod}
	python2 setup.py build || return 1
	python2 setup.py install --root=${pkgdir} || return 1

	# license
	install -Dm644 "${srcdir}/${_svnmod}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
	# readme
	install -Dm644 "${srcdir}/${_svnmod}/README" "${pkgdir}/usr/share/doc/${pkgname}/README"

	# deleting unnecessary data files from pkg
	rm ${pkgdir}/usr/{README,COPYING}
}
