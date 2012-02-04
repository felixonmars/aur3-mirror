# Maintainer: vando <facundo@esdebian.org>

pkgname=yapsy
_pkgname=Yapsy
pkgver=1.8
pkgrel=1
pkgdesc="A simple plugin system for Python applications"
arch=('i686' 'x86_64')
url="http://yapsy.sourceforge.net"
license=('BSD')
depends=('python2' 'python2-distribute')
source=('http://pypi.python.org/packages/source/Y/Yapsy/Yapsy-1.8.tar.gz')
md5sums=('0ecf0217f7350df39049f89e33511a28')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  msg "Starting make..."
  python2 setup.py install --root=${pkgdir} || return 1

}
