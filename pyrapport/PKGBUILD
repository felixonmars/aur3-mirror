# Maintainer: Chipster Julien <julien dot chipster @ archlinux dot fr>
pkgname=pyrapport
url="http://www.google.com"
pkgver=0.1
pkgrel=5
pkgdesc="To create reports quickly with LaTeX quality"
arch=('any')
license=('WTFPL')
depends=(python python-pyqt4)
source=($pkgname-$pkgver.tar.gz)
md5sums=('107874fd6cafa456e64e3487a8f8fb51')

package()
{
  cd "$srcdir/$pkgname-$pkgver/"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
