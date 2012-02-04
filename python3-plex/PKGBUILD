# Contributor: Paul Colomiets pc at gafol dot net
pkgname=python3-plex
pkgver=2.0.0dev
pkgrel=1
pkgdesc="A lexical analysis module for Python."
arch=('i686' 'x86_64')
url="http://www.cosc.canterbury.ac.nz/greg.ewing/python/Plex/"
license=('public domain')
makedepends=('python3')
install=
source=(http://pypi.python.org/packages/source/p/plex/plex-${pkgver}.tar.gz
    'machines.patch')
md5sums=('2b0313b4b0d22d946bfd255657329ab7'
    'd567b57bd465fd62272db1a30cf5f3b5')

build() {
    cd $startdir/src/plex-${pkgver}
    2to3 -w src/plex/*.py
    sed -i 's/from types import TupleType/TupleType = tuple/' src/plex/*.py
    sed -i 's/from sys import maxsize/from sys import maxsize as maxint/' src/plex/*.py
    sed -i 's/import exceptions/ /' src/plex/*.py
    sed -i 's/exceptions.Exception/Exception/' src/plex/*.py
    sed -i 's/string.join/(lambda a,b: b.join(a))/' src/plex/*.py
    sed -i 's/((lo + hi) \/ 2)/((lo + hi) \/\/ 2)/' src/plex/transitions.py
    patch -p0 -i ../machines.patch
	install -d $startdir/pkg/usr/lib/python3.1/site-packages/plex
	install src/plex/*.py $startdir/pkg/usr/lib/python3.1/site-packages/plex
	python3 -m compileall -d /usr/lib/python3.1/site-packages/plex $startdir/pkg/usr/lib/python3.1/site-packages/plex
	python3 -Om compileall -d /usr/lib/python3.1/site-packages/plex $startdir/pkg/usr/lib/python3.1/site-packages/plex
}

