# Maintainer: Jakob Gruber (jakob dot gruber at kabelIGNORETHISnet dot at)

pkgname=submin
pkgver=2.1.0
_pkgver=2.1.0-1
pkgdesc="Web frontend for subversion/trac administration."
pkgrel=1
arch=('any')
url="http://supermind.nl/submin/index.html"
license=('MIT')
depends=('subversion' 'python2' 'apache')
source=("http://supermind.nl/submin/current/${pkgname}-${_pkgver}.tar.gz")

build() {
  cd "${srcdir}"/${pkgname}-${_pkgver}

  python2 setup.py install --root="${pkgdir}"
}

md5sums=('5e228a9b81d9744497b5d68107a76de3')
