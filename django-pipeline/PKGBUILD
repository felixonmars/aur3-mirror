# Maintainer: Steven Allen <steven@stebalien.com>

pkgname='django-pipeline'
pkgver=1.2.24
pkgrel=1
pkgdesc="An asset packaging library for Django, providing both CSS and JavaScript concatenation and compression, built-in JavaScript template support, and optional data-URI image embedding."
arch=('any')
url="https://github.com/cyberdelia/django-pipeline"
license=('MIT')
depends=('python2' 'python2-distribute')
optdepends=('yuicompressor: for css and js compression')
source=("http://pypi.python.org/packages/source/d/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('972d1be867a61680b67e09a6ec55d839')

package() {
	cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
	rm -rf "$pkgdir"/usr/lib/python*/site-packages/tests/
}
