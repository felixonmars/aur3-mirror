# Maintainer: Panagiotis Mavrogiorgos (pmav99) <> (gmail)

pkgname=meteo-qt
pkgver=0.5.0
pkgrel=1
pkgdesc="System tray application for weather status information."
arch=(any)
url="https://github.com/dglent/meteo-qt"
license=('GPL3')
depends=('python' 'python-urllib3' 'python-pyqt5' 'python-lxml')
optdepends=()
provides=('meteo-qt')
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
source=(https://github.com/dglent/meteo-qt/archive/v0.5.0.tar.gz)
md5sums=('51a5fd84e25134e0584ec50e01451f8f')

package()
{
  # Install using setup.py
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --root="${pkgdir}/" --optimize=1

}
# vim: sw=2 ts=2 et:
