# Maintainer: Patrice Peterson <runiq at archlinux dot us>
# Contributor: Chris Brannon <cmbrannon79@gmail.com>
# Contributor: BorgHunter <borghunter at gmail dot com>

pkgname=python-urllib3
_pkgname=urllib3
pkgver=1.8
pkgrel=1
pkgdesc="HTTP library with thread-safe connection pooling and file post support, Python 3 version"
arch=("any")
url="https://github.com/shazow/urllib3"
license=("MIT")
depends=("python")
makedepends=("python-distribute")
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/shazow/$_pkgname/tarball/$pkgver" 
        LICENSE)
md5sums=('0de23a4244f34db3f15bdd3d2e0d9d5c'
         '350846ab4dd11ce105b570c15c1b0764')

package() {
  cd "$srcdir/shazow-${_pkgname}-8a8c601"
  python setup.py install --root="${pkgdir}"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
