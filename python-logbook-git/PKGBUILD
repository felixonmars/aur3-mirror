pkgname=python-logbook-git
pkgver=20110606
pkgrel=1
pkgdesc="Logging system for Python that aims to replace the standard library's logging module"
arch=(any)
url="http://packages.python.org/Logbook/"
license=('BSD')
depends=("python>3.1")
source=()
md5sums=()

_gitroot="git://github.com/mitsuhiko/logbook.git"
_gitname="logbook"

build() {
	cd "$srcdir"
	msg "Connecting to GIT server...."
	
	if [ -d $_gitname ] ; then
	   cd $_gitname && git pull origin
	   msg "The local files are updated."
	else
	   git clone $_gitroot $_gitname
	   cd $_gitname
	fi
	
	python setup.py install --root=${pkgdir} || return 1
}