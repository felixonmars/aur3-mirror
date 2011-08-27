# Contributor: Andreas Pieber <anpieber at gmail>
pkgname=pver
pkgver=0.3.1
pkgrel=1
pkgdesc="build tool wrapper"
arch=('any')
url="http://github.com/anpieber/pver"
license=('BSD')
depends=('python')
makedepends=('setuptools')
source=(http://github.com/downloads/anpieber/pver/$pkgname-$pkgver.zip)

build() {
  cd ${srcdir}/"$pkgname-$pkgver"
  python setup.py build || return 1
  python setup.py install --root=${pkgdir} --optimize=1 || return 1
}

md5sums=('9d548aa48a703451dbb59b41f392a4c8')

