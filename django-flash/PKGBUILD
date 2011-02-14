# Contributor: Daniel Martins <daniel.tritone at gmail dot com>
# Contributor: Gianni Vialetto <g dot vialetto at gmail dot com>

pkgname=django-flash
pkgver=1.8.0
_pkgver=1.8
pkgrel=1
pkgdesc="A simple Django extension that provides support for Rails-like flash messages."
arch=(any)
url="http://djangoflash.destaquenet.com/"
license=('BSD')
depends=('python' 'django>=1.0' 'ez-setup')
makedepends=('python-distribute')
source=(http://pypi.python.org/packages/source/d/django-flash/$pkgname-$_pkgver.tar.gz)
md5sums=('6e2dabeb1b25bfb2e1c51ee1916dcbea')

build() {
  cd "$srcdir/$pkgname-$_pkgver"
  python setup.py build
  python setup.py install --root=$pkgdir 
}
