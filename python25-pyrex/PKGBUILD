# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: Arjan timmerman <arjan@soulfly.nl>
# Contributor: Link Dupont <link@subpop.net>
# Contributor: fnord0 <fnord0 AT riseup DOT net>

pkgname=python25-pyrex
pkgver=0.9.9
pkgrel=2
pkgdesc="Language for writing Python extension modules, for Python 2.5"
arch=(any)
url="http://www.cosc.canterbury.ac.nz/~greg/python/Pyrex/"
license=('APACHE')
depends=('python25')
source=(http://www.cosc.canterbury.ac.nz/~greg/python/Pyrex/Pyrex-${pkgver}.tar.gz)
md5sums=('515dee67d15d4393841e2d60e8341947')

build() {
  cd "${srcdir}/Pyrex-${pkgver}"
  python2.5 setup.py install --root="${pkgdir}" --prefix=/usr || return 1
  cd "${pkgdir}/usr/bin"
  mv pyrexc pyrexc2.5
}
