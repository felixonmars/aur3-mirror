# Maintainer: Aaron DeVore <aaron.devore@gmail.com>
# Contributor:  tocer <tocer.deng@gmail.com>
# Contributor: Piotr Beling <qwak@stud.ics.p.lodz.pl>
# Contributor: Douglas Soares de Andrade <dsandrade@gmail.com>

pkgname=python3-xlrd
pkgver=0.9.0
pkgrel=1
pkgdesc="A library for developers to use to extract data from Microsoft Excel (tm) spreadsheet files."
url="https://github.com/python-excel/xlrd"
makedepends=('python3')
provides=("python-xlrd")
source=("https://pypi.python.org/packages/source/x/xlrd/xlrd-$pkgver.tar.gz")
md5sums=('61102459833cc31d6b05404325fa45a8')
arch=('any')
license=('BSD')

package() {
  cd "$srcdir/xlrd-$pkgver"
  python3 setup.py install --root="$pkgdir"
  local docdir
  docdir="$pkgdir/usr/share/doc/$pkgname/"
  install -D -m644 "xlrd/licences.py" \
    "$pkgdir/usr/share/licenses/$pkgname/licences.py"
  
  mv "$pkgdir"/usr/bin/runxlrd.py{,3}
  
  mkdir -p "$docdir"
  cp -a xlrd/doc/* "$docdir"
}
