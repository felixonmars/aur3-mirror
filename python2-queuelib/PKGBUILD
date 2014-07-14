# Maintainer: PyroDevil <p dot devil at gmail dot com>
pkgbase="python2-queuelib"
pkgname="python2-queuelib-old"
pkgver=1.1.1
pkgrel=2
pkgdesc="Collection of persistent (disk-based) queues."
arch=(any)
license=('BSD')
url="http://scrapy.org"
makedepends=('git')
optdepends=()
provides=()
conflicts=()
options=(!emptydirs)
depends=("python2")
source=("git://github.com/scrapy/queuelib.git#tag=v${pkgver}")
md5sums=('SKIP')

function package {
  cd "${srcdir}/queuelib"
  python2 setup.py install --root="${pkgdir}"
  
  # copying license information
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # copying readme information
  install -D -m644 "README.rst" "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}

