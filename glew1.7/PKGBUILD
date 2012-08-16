# Maintainer: josephgbr <rafael.f.f1@gmail.com>

_pkgbase=glew
pkgname=${_pkgbase}1.7
pkgver=1.7.0
pkgrel=1
pkgdesc="Legacy version of the OpenGL Extension Wrangler Library"
arch=('i686' 'x86_64')
url="http://glew.sourceforge.net"
license=('BSD' 'MIT' 'GPL')
depends=('libxmu' 'libxi' 'mesa' "${_pkgbase}")
source=(http://downloads.sourceforge.net/${_pkgbase}/${_pkgbase}-${pkgver}.tgz)
sha1sums=('9266f2360c1687a96f2ea06419671d370b2928d1')

build() {
  cd ${_pkgbase}-${pkgver}
  sed -i 's|lib64|lib|' config/Makefile.linux
  make
}

package() {
  cd ${_pkgbase}-${pkgver}
  make GLEW_DEST="${pkgdir}/usr" install.all
  chmod 0755 "${pkgdir}"/usr/lib/libGLEW*.so.${pkgver}
  rm "${pkgdir}"/usr/lib/{libGLEW,libGLEWmx}.{a,so}
  rm -rf "${pkgdir}"/usr/{bin,include,share,lib/pkgconfig}
}
