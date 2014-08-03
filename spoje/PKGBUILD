# Maintainer: Nicky726 (Nicky726 <at> gmail <dot> com)

pkgname=spoje
pkgver=0.7.19
pkgrel=1
pkgdesc="CLI aplication to search Czech public transport connections"
arch=('any')
url="http://code.google.com/p/spoje/"
license=('GPL')
depends=('python2')
source=(http://${pkgname}.googlecode.com/svn/tags/release-${pkgver}/${pkgname}.py)
sha256sums=('1719d8f73b6aad522bf1668400fdd845477ab3e57f4430879876072bb4d0b18c')

build() {
  # It's python2 script
  sed -i -e "s/env python/env python2/" \
	"${srcdir}/${pkgname}.py"
}

package() {
  install -Dm755 "${srcdir}/${pkgname}.py" "${pkgdir}/usr/bin/${pkgname}"
}


