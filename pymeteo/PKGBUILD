# Maintainer: Chipster Julien <julien dot chipster @ archlinux dot fr>
pkgname=pymeteo
url="https://github.com/Chipsterjulien/pymeteo"
pkgver=0.1
pkgrel=1
pkgdesc="Get temperature"
arch=('any')
license=('WTFPL')
depends=(python python-pyqt4)
source=($pkgname-$pkgver.tar.gz)
md5sums=('78066a79f1cf54c1c0a90e5a476f5850')

package()
{
  cd "$srcdir/$pkgname-$pkgver/"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
