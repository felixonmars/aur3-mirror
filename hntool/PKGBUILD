# Maintainer: Hugo Doria <hugo@archlinux.org>

pkgname=hntool
pkgver=0.1.2
pkgrel=1
pkgdesc="A hardening tool for *nixes"
arch=('any')
url="http://hntool.net"
license=('GPL2')
depends=('lsof' 'python>=2.4')
makedepends=('setuptools')
source=(http://${pkgname}.googlecode.com/files/${pkgname}-${pkgver}.tar.gz)
md5sums=('87e60acb3d3d984f6330eb103c87776b')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python setup.py install --root=${pkgdir}
}
