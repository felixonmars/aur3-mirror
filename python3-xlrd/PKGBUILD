# Maintainer: Aaron DeVore <aaron.devore@gmail.com>
# Contributor:  tocer <tocer.deng@gmail.com>
# Contributor: Piotr Beling <qwak@stud.ics.p.lodz.pl>
# Contributor: Douglas Soares de Andrade <dsandrade@gmail.com>

_proj=xlrd
pkgname="python3-$_proj"
_acc=takluyver
_rev=f5846f7
# Commit count: git rev-list --count <tag>.."$_rev"
pkgver="0.8.0+22+g${_rev}"
pkgrel=1
pkgdesc="A library for developers to use to extract data from Microsoft Excel (tm) spreadsheet files."
url="https://github.com/python-excel/$_proj/pull/2"
makedepends=('python3')
provides=("python-$_proj")
source=("https://github.com/$_acc/$_proj/tarball/$_rev")
md5sums=('31b5f64f7f0cfe83cba2a05f33267d8d')
arch=('any')
license=('BSD')

_tardir="$_acc-$_proj-$_rev"

build() {
  cd "$srcdir/$_tardir"
  python3 setup.py install --root="$pkgdir"
}

package() {
  cd "$srcdir/$_tardir"
  local docdir
  docdir="$pkgdir/usr/share/doc/$pkgname/"
  install -D -m644 "xlrd/licences.py" \
    "$pkgdir/usr/share/licenses/$pkgname/licences.py"
  
  # This script is not ported to Python 3 and would conflict with the version
  # provided in the Python 2 package anyway
  rm "$pkgdir/usr/bin/runxlrd.py"
  
  mkdir -p "$docdir"
  cp -a xlrd/doc/* "$docdir"
}
