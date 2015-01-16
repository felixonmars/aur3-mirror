# Maintainer: Ner0

pkgname=my-weather-indicator
pkgver=0.6.9
_ubver=0extras14.04.2
pkgrel=1
pkgdesc="A simple weather indicator"
arch=('any')
url="https://www.launchpad.net/my-weather-indicator"
license=('GPL3')
depends=('hicolor-icon-theme' 'python2' 'libchamplain' 'lsb-release' 'gtk3' 'gdk-pixbuf2' 'libappindicator3' 'python2-lxml' 'python2-dateutil' 'python2-geoip' 'python2-geoclue' 'libnotify')
makedepends=('python2-distutils-extra' 'python2-polib')
source=("https://launchpad.net/~atareao/+archive/atareao/+files/${pkgname}_${pkgver}-${_ubver}.tar.gz")
md5sums=('98cf834547b4dc8af6732e57ec7bf888')

package() {
  cd $pkgname

  sed -i 's/-langpack//' setup.py src/comun.py
  sed -i 's/python3/python2/;s/env\ python3\ /env\ python2/' src/*.py bin/$pkgname

  python2 setup.py install --root="$pkgdir/" --optimize=1
}
