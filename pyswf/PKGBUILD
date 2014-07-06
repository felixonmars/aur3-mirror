pkgname="pyswf"
pkgdesc="A Python library for reading and writing SWF files."
pkgver="1.4"
pkgrel="1"
url="https://pypi.python.org/pypi/pyswf/${pkgver}"
arch=('i686' 'x86_64')
depends=('python2-lxml' 'python2-pillow')
license=('MIT')
source=('https://pypi.python.org/packages/source/p/pyswf/pyswf-1.4.tar.gz')
md5sums=('5bb62b24445c7b42c3954179fdada4ed')

package() {
	cd $srcdir/${pkgname}-${pkgver}
	msg "Fixing Permissions..."
	find . -type f -exec chmod 666 {} \;
	chmod +x setup.py
	python2 setup.py install --prefix=/usr --root="$pkgdir" || return 1
}
