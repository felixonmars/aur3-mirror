# Contributor: Nicolas Quiénot <niQo @ aur>

pkgname=iramuteq
pkgver=0.6a3
_origpkgver=0.6-alpha3
pkgrel=1
pkgdesc="R interface for multidimensional analysis of texts"
url="http://www.iramuteq.org/"
options=(!libtool)
license="LGPL"
depends=('python' 'wxpython' 'python2-xlrd' 'r')
makedepends=()
source=(http://sourceforge.net/projects/${pkgname}/files/${pkgname}-${_origpkgver}/${pkgname}_${_origpkgver}.tar.gz/download)
arch=('any')

build() {
  cd ${srcdir}/${pkgname}-${_origpkgver}
  rm -rf {debian,configuration/.svn}
  sed -i -e 's|^python|/usr/bin/python2|' iramuteq
}

package() {
  cd "$srcdir/${pkgname}-${_origpkgver}"
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/share/iramuteq
  cp -r * ${pkgdir}/usr/share/iramuteq/
  install -Dm755 iramuteq ${pkgdir}/usr/bin/iramuteq || return 1
}

md5sums=('1f8d9777aaf136f0fd17d74d1aeea372')
