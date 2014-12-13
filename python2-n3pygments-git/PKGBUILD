pkgname=python2-n3pygments-git
pkgver=r26.93e7055
pkgver() {
	cd "n3pygments"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=1
pkgdesc="Pygments lexer for N3/Turtle and SPARQL"
arch=('any')
url="https://github.com/gniezen/n3pygments"
license=('MIT')
depends=('python2-pygments')
makedepends=('python2-setuptools')
source=('git+http://github.com/gniezen/n3pygments.git')
md5sums=('SKIP')

package() {
	cd $srcdir/n3pygments/;
	python2 setup.py install --root=$pkgdir/ --optimize=1
}
