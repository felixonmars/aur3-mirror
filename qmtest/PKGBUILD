# Contributor: Jakub Schmidtke <sjakub-at-gmail.com>

pkgname=qmtest
pkgver=2.4.1
pkgrel=1
pkgdesc="Cost-effective general purpose testing solution"
arch=('i686' 'x86_64')
url="http://www.codesourcery.com/qmtest"
license=('GPL')
depends=('python>=2.3')
source=(http://www.codesourcery.com/public/${pkgname}/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz)
md5sums=('860d4795351453013c9aaab246fd93ba')

build() {
  cd "$startdir/src/$pkgname-$pkgver"
#  patch -Np1 < ../root_path.patch || return 1
  python setup.py install --root="$startdir/pkg" --prefix=/usr || return 1
}

# vim:set ts=2 sw=2 et:
