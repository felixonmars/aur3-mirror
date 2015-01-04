# Maintainer: anex <assassin.anex[@]gmail.com>

pkgname=meteo-qt-git
pkgver=v0.4.3.1.g5e02ecb
pkgrel=1
pkgdesc="System tray application for weather status information."
arch=(any)
url="https://github.com/dglent/meteo-qt"
license=('GPL3')
makedepends=('git')
depends=('python' 'python-urllib3' 'python-pyqt5' 'python-lxml')
optdepends=()
provides=('meteo-qt')
conflicts=('meteo-qt')
replaces=('meteo-qt')
backup=()
options=(!emptydirs)
source=('git://github.com/dglent/meteo-qt.git')
md5sums=('SKIP')

pkgver(){
  cd meteo-qt
  echo "$(git describe --long --tags | tr - .)"
}

package()
{
  # Install using setup.py
  cd "$srcdir/meteo-qt"
  python3 setup.py install --root="${pkgdir}/" --optimize=1
}
