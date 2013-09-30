# Maintainer: David Verelst  <david dott verelst hat gmail com>
pkgname=python2-pyshp-svn
_pkgname=pyshp
pkgver=91
pkgrel=1
pkgdesc="Python Shapefile Library"
arch=('i686' 'x86_64')
url="https://code.google.com/p/pyshp/"
license=('MIT')
depends=('python2')
makedepends=('subversion')
optdepends=()
source=("${_pkgname}-read-only::svn+http://pyshp.googlecode.com/svn/trunk/")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}-read-only"
  svnversion | tr -d [A-z]
}

package() {
  cd "${srcdir}/${_pkgname}-read-only"
  install -Dm644 shapefile.py "${pkgdir}/usr/lib/python2.7/site-packages/pyshp/shapefile.py"
#  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}


