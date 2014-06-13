# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=python-stripe
_pkgname=stripe
pkgver=1.17.0
pkgrel=1
pkgdesc="A python svg graph plotting library"
arch=('any')
url="https://stripe.com/"
license=('MIT')
depends=('python')
options=(!emptydirs)
source=("https://code.stripe.com/stripe/${_pkgname}-${pkgver}.tar.gz")
md5sums=('cfd8baaef271fa94ede64a16cb8350c2')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

