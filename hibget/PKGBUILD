# Maintainer: Joel Pedraza <pkgs@joelpedraza.com>

pkgname=hibget
pkgver=0.0.2
pkgrel=2
pkgdesc="Humble Bundle file downloader"
arch=('any')
url="https://github.com/saik0/hibget"
license=('MIT')
makedepends=('python' 'python-setuptools')
depends=('python-appdirs' 'python-progressbar' 'python-humblebundle>=0.0.6')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/h/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha1sums=('43d7b3807752f2c0e09035dd1c1e1c3444f5e4b4')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
