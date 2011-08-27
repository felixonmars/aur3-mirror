# $Id$
# Maintainer : Ionut Biru <ibiru@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>

pkgname=venusian
pkgver=0.6
pkgrel=1
pkgdesc="A library for deferring decorator actions."
license=('custom:BSD')
arch=('i686' 'x86_64')
url="http://www.repoze.org"
depends=('python2')
source=(http://pypi.python.org/packages/source/v/venusian/venusian-${pkgver}.tar.gz)
md5sums=('e2d37698f0f63d1c128f31f0d073db9f')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python2 setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
}
