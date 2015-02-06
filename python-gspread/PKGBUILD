# Maintainer: Sergey Malkin <adresatt@gmail.com>

pkgname=python-gspread
_pkgname=gspread
pkgver=0.2.2
pkgrel=1
pkgdesc="Google Spreadsheets Python API"
arch=("any")
url="https://github.com/burnash/gspread"
license=('MIT')
depends=('python')
source=("https://pypi.python.org/packages/source/g/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('83148c97d7744c89d9a34d53766714d3')

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="${pkgdir}/"
}
