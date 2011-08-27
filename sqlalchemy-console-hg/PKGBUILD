# Contributor: DasIch <dasdasich@googlemail.com>

pkgname=sqlalchemy-console-hg
pkgver=21
pkgrel=2
pkgdesc="Interactive database command line using sqlalchemy"
arch=('any')
license=('AGPL')
url="http://codeflow.org/#sqlac"
makedepends=('mercurial')
depends=('python' 'python-sqlalchemy' 'setuptools')
source=()
conflicts=('sqlalchemy-console' 'sqlalchemy-console-hg')
replaces=('sqlalchemy-console' 'sqlalchemy-console-hg')
md5sums=()

_hgroot="http://hg.codeflow.org"
_hgrepo="sqlalchemy_console"

build() {
	cd ${srcdir}
	if [ -d ${_hgrepo}/.hg ]; then
		cd ${_hgrepo}
		hg pull -u
	else
		echo ${_hgroot}/${_hgrepo}
		hg clone ${_hgroot}/${_hgrepo}
		cd ${_hgrepo}
	fi
	python setup.py install --root=$startdir/pkg
	install -D -m644 LICENSE $pkgdir/usr/share/licenses/sqlalchemy_console/LICENSE
	install -D -m644 agpl-3.0.txt $pkgdir/usr/share/licenses/sqlalchemy_console/agpl-3.0.txt
}
