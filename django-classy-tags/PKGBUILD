# Contributor: Andrey Mivrenik <gim at fastmail dot fm>
# Contributor: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=django-classy-tags
pkgver=0.6.0
pkgrel=1
pkgdesc="Class based template tags for Django"
arch=('any')
url="https://github.com/ojii/django-classy-tags"
license=('BSD')
depends=('python' 'python-django')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://github.com/ojii/django-classy-tags/archive/${pkgver}.tar.gz")
sha256sums=('be95e7c0dccbf36382c55b0cdc7b7d342f69ae03b72975e0152e2484df5426c3')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
# vim:set ts=2 sw=2 et:
