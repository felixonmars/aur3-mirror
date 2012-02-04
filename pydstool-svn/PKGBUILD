# Contributor: quantax -- contact via Arch Linux forum or AUR

pkgname=pydstool-svn
_pkgname=PyDSTool
pkgver=416
pkgrel=1
pkgdesc="Integrated simulation, modeling and analysis package for dynamical systems."
arch=('i686')
url="http://www.cam.cornell.edu/~rclewley/cgi-bin/moin.cgi/FrontPage"
license=('BSD')
depends=(python-matplotlib python-scipy)
optdepends=('gcc: C-based integrator and AUTO support' \
		'python-constraint' \
		'swig: C-based integrator and AUTO support')
conflicts=(pydstool)
provides=(pydstool)
md5sums=()

_svntrunk=http://jay.cam.cornell.edu/svn/PyDSTool/
_svnmod=pydstool

build() {
	cd "${srcdir}"

	if [ -d ${_svnmod}/.svn ]; then
		(cd ${_svnmod} && svn up -r ${pkgver})
	else
		svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
	fi

	msg "SVN checkout done or server timeout"
	msg "Starting make..."

	rm -fr "${pkgdir}/usr/lib/python2.6/site-packages/${_pkgname}"
	install --mode=0755 --directory "${pkgdir}/usr/lib/python2.6/site-packages"
	cd "${pkgdir}/usr/lib/python2.6/site-packages"

	cp -r "${srcdir}/${_svnmod}/trunk/${_pkgname}" ./ || return 1
	find ${_pkgname} -name .svn | while read file; do
		rm -fr ${file}
	done
}

