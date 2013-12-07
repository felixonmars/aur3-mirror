# Maintainer: Stunts <f.pinamartins@gmail.com>
# Contributor: damir <damir@archlinux.org>

pkgname=python-biopython
_upstream_pkgname=biopython
pkgver=1.63
pkgrel=1
pkgdesc="Freely available Python tools for computational molecular biology"
arch=('i686' 'x86_64')
url="http://www.biopython.org"
license=('custom')
depends=('glibc' 'python' 'python-numpy')
source=(http://www.biopython.org/DIST/${_upstream_pkgname}-${pkgver}.tar.gz)
md5sums=('09c58433150849b131d2d9bbfdf342d3')

build() {
  cd "${srcdir}/${_upstream_pkgname}-${pkgver}"
  yes | python setup.py build
}

package() {
  cd "${srcdir}/${_upstream_pkgname}-${pkgver}"
  yes | python setup.py install --root="${pkgdir}"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
