# Contributor: Vincent Berset <msieurhappy@gmail.com>

pkgname=httpie
pkgver=0.2.5
pkgrel=2
pkgdesc="cURL-like tool for humans "
arch=('any')
url="http://pypi.python.org/pypi/httpie"
license=('BSD')
makedepends=('python')
depends=('python' 'python-requests' 'python-chardet2' 'python-pygments')
source=("http://pypi.python.org/packages/source/h/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('be545e192524ef84e6d3f81289c445db')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python ./setup.py install --root=$pkgdir
}
