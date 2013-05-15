# Maintainer: Sarkasper <echo a2FzcGVyLm1lbnRlbkBnbXguY29tCg== | base64 -d>

pkgname=boodler-qt
_pkgname=boodle-ui-qt
pkgver=1.1
pkgrel=1
pkgdesc="a Boodler Qt GUI."
arch=('any')
url="http://www.boodler.org"
license=('LGPL')
depends=('boodler' 'python2-pyqt')
source=("https://raw.github.com/Sarkasper/boodle-ui-qt/master/boodle-ui-qt.py")
md5sums=('a6407e388f0f2a14fde413ed55360353')

package() {
  install -d "$pkgdir/usr/bin" || return 1
  install -m755 "$startdir/$_pkgname.py" "$pkgdir/usr/bin/$pkgname" || return 1
}
