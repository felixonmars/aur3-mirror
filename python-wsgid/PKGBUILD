# Maintainer: Josh VanderLinden <arch@cloudlery.com>
pyname=m2wsgid
pkgname=python-wsgid
pkgver=0.7.0
pkgrel=1
pkgdesc="A complete WSGI environment for mongrel2 handlers"
arch=('any')
url="https://github.com/daltonmatos/wsgid"
license=('BSD')
depends=('python' 'mongrel2')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/m/${pyname}/${pyname}-0.7.0.tar.gz")
md5sums=('9f41acc5222402e3a7dcd9b3fbf9b302')

package() {
  cd "$srcdir/$pyname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
