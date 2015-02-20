# Contributor: Andrey Mivrenik <gim at fastmail dot fm>
# Contributor: Ryan Coyner <rcoyner@gmail.com>
# Contributor: Apkawa <apkawa@gmail.com>
pkgname=django-mptt
pkgver=0.6.1
pkgrel=1
pkgdesc='Utilities for implementing Modified Preorder Tree Traversal in Django'
arch=('any')
url='https://github.com/django-mptt/django-mptt/'
license=('BSD')
depends=('python' 'python-django>=1.4.2')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://github.com/django-mptt/django-mptt/archive/${pkgver}.tar.gz")
sha256sums=('99ee5e5f0f22840588f9e4ab9c3c23e98c8e8456a384130bb7947e49e3d88115')

build() { 
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --install-data=/usr/share/$pkgname --optimize=1
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
# vim:set ts=2 sw=2 et:
