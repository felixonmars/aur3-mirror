# Maintainer: Ferrazzo Riccardo <f.riccardo87@gmail.com>
pkgname=python-phidgets
_pkgname=PhidgetsPython
pkgver=2.1.8.20111121
pkgrel=1
pkgdesc="Python library for phidgets microcontroller"
arch=('x86_64' 'i686')
url='http://www.phidgets.com/'
license=('GPLv3')
depends=('python2' 'libphidget>=2.1.8')
source=("http://www.phidgets.com/downloads/libraries/${_pkgname}_${pkgver}.zip")
md5sums=('edf87c8cb5c511bcf638820d66414860')

build() {
  cd "$srcdir/$_pkgname"
  python2 setup.py install --prefix=/usr --root="$pkgdir" || return 1
}

# vim:set ts=2 sw=2 et: 
