# Contributor: Andrey Mivrenik <gim at fastmail dot fm>
# Contributor: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=django-sekizai
pkgver=0.8.1
pkgrel=1
pkgdesc="Django Template Blocks with extra functionality"
arch=('any')
url="https://github.com/ojii/django-sekizai"
license=('BSD')
depends=('python' 'python-django')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://github.com/ojii/django-sekizai/archive/${pkgver}.tar.gz")
sha256sums=('7935764294580ed367d480da36e17799fb82a9e41c1ae7350086b3668bfb7de4')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
# vim:set ts=2 sw=2 et:
