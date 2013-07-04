pkgname=python2-dmidecode-git
pkgver=3.10.10.37.gb82aff2
pkgrel=1
pkgdesc="The python implementation of what dmidecode does. Supports extracting \
         the data as both Python dictionaries and XML data (via libxml2)."
arch=('i686' 'x86_64')
url="https://fedorahosted.org/python-dmidecode/"
license=('GPL')
depends=('python2' 'python2-lxml')
makedepends=('git')
source=(git://git.fedorahosted.org/python-dmidecode.git)
md5sums=(SKIP)

pkgver() {
	cd "$srcdir/python-dmidecode"
	git describe --always | sed 's\-\.\g' | sed 's\^v\\'
}

build() {
	cd "$srcdir/python-dmidecode"
	python2 src/setup.py build
}

package() {
	cd "$srcdir/python-dmidecode"
	python2 src/setup.py install --root="${pkgdir}" --optimize=1
}
