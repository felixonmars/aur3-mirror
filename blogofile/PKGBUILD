# Maintainer: Endre Szabo <aur@end.re>
pkgname=blogofile
pkgver=0.7.1
pkgrel=3
pkgdesc="A static website compiler, primarily designed to be a simple blogging engine."
arch=('any')
url="http://blogofile.com/"
license=('MIT')
depends=(
	'python2' 'python2-distribute' 'docutils' 'python2-pygments' 'python-textile'
	'python2-markdown' 'python2-mako' 'python2-pytz' 'python-beautifulsoup' 'python2-yaml'
)
provides=('blogofile=0.7.1')
options=(!emptydirs)
source=(
	"http://pypi.python.org/packages/source/B/Blogofile/$pkgname-$pkgver.tar.gz"
	"remove-argparse-dependency.patch"
)
md5sums=(
	'a1fe1d9018eb5a84a076cd3f0d4bf8a2'
	'c891d3af0e20bc406761f0f4550fab5e'
)
package() {
	cd "$srcdir/$pkgname-$pkgver"
	patch -p1 -i ../../remove-argparse-dependency.patch
	install -v -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	python2 setup.py install "--root=$pkgdir/" --optimize=1
}
