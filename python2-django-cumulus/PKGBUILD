# Maintainer: Daniel Wallace <danielwallace at gtmanfred dot com>
pkgname=python2-django-cumulus
pkgver=1.1.0
pkgrel=1
pkgdesc="A set of tools to utilize the python-swiftclient api through Django"
arch=('i686' 'x86_64')
url="https://github.com/richleland/django-cumulus"
license=('custom')
depends=('python2-pyrax')

source=("https://github.com/richleland/django-cumulus/archive/$pkgver.tar.gz")
md5sums=('e086abdb90d91dc0af649a43c82483f3')

build() {
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
}

# vim:set ts=2 sw=2 et ft=PKGBUILD:
