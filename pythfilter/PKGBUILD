# Contributor: gustavo chain <g@0xff.cl>

pkgname="pythfilter"
pkgver=1.5.5
pkgrel=1
license="GPL"
arch=('i686' 'x86_64')
pkgdesc="Doxygen filter which can be used to document Python source code."
depends=('python' 'doxygen')
source=(http://i31www.ira.uka.de/~baas/pydoxy/pythfilter.py)
url="http://i31www.ira.uka.de/~baas/pydoxy/"
md5sums=('d7ed8012ab758e7821ae74b38cb8d261')

build() {
	cd $startdir/src/
	install -D -m755 pythfilter.py ${startdir}/pkg/usr/bin/pythfilter.py
}
