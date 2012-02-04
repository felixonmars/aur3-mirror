# Contributer: N30N <archlinux@alunamation.com>

pkgname="pyflakes-svn"
pkgver=16764
pkgrel=1
pkgdesc="a lint-like tool for Python"
url="http://divmod.org/trac/wiki/DivmodPyflakes"
source=()
md5sums=()
depends=("python")
makedepends=("subversion" "setuptools")
provides=("pyflakes")
conflicts=("pyflakes")
arch=("i686" "x86_64")
license=("custom")

_svntrunk="http://divmod.org/svn/Divmod/trunk/Pyflakes"
_svnmod="pyflakes"

build() {
	cd ${srcdir}
	msg "Connecting to ${_svnmod} SVN server......."
	if [ -d ${_svnmod}/.svn ]; then
		cd ${_svnmod}
		svn update -r ${pkgver} || return 1
	else
		svn co ${_svntrunk} ${_svnmod} --config-dir ./ -r ${pkgver} || return 1
		cd ${_svnmod}
	fi

	# fix setup http://divmod.org/trac/ticket/2709
	sed -e "s|^\(\s\+url=\"\)[^\"]*|\1${url}|" \
		-e "s/^\(\s\+packages=[^]]*\)/\1, \"pyflakes.scripts\", \"pyflakes.test\"/" \
		-i setup.py

	python setup.py install --root=${pkgdir} || return 1
	install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${_svnmod}/LICENSE
}
