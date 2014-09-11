# Maintainer: Patrice Peterson <runiq at archlinux dot us>

pkgname="python2-envoy"
_pkgname="envoy"
pkgver=0.0.3
pkgrel=1
pkgdesc="Convenience wrapper around the subprocess module"
arch=('any')
url="https://github.com/kennethreitz/envoy"
license=('MIT')
depends=('python2')
options=(!emptydirs)
source=("http://pypi.python.org/packages/source/e/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('548cc52576b6d73fa886439e3100d576')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
