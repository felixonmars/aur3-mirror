# Maintainer: Christoph Giesel <mail@cgiesel.de>

pkgname=pywws-git
_gitname=pywws
pkgver=v13.06_r1022.2.ga5c9c54
pkgrel=1
pkgdesc="Python software for USB Wireless WeatherStations"
url="http://jim-easterbrook.github.io/pywws/doc/en/html/index.html"
license=('GPL2')
arch=('any')
options=('!strip')

depends=('python2-pyusb')
makedepends=('git')

source=("${_gitname}::git+https://github.com/jim-easterbrook/pywws.git")
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe --always | sed 's|-|.|g'
}

build() {
  cd $_gitname
  python2 setup.py msgfmt
  #python2 setup.py build_sphinx
}

package() {
  cd $_gitname
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
