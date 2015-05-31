# Contributor: Andrey Mivrenik <gim at fastmail dot fm>
# Contributor: Ryan Coyner <rcoyner@gmail.com>
# Contributor: James Pearson <james.m.pearson+arch@gmail.com>
pkgname=django-tagging
pkgver=0.3.4
pkgrel=1
pkgdesc="A generic tagging application for Django projects"
arch=('any')
url='https://pypi.python.org/pypi/django-tagging'
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools')
changelog='CHANGELOG.txt'
source=("https://pypi.python.org/packages/source/d/django-tagging/django-tagging-${pkgver}.tar.gz")
sha256sums=('a3cee6e36c3cb7ccd9d13d71ca42cb8826914d66b20c3a5e987efa12b3a83a3d')

build() { 
  cd "$srcdir/django-tagging-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/django-tagging-$pkgver"
  python2 setup.py install --root=$pkgdir --optimize=1
  install -D -m644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
# vim:set ts=2 sw=2 et:
