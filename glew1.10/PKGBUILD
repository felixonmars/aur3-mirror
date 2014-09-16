# Contributor: trya <tryagainprod@gmail.com>
# Maintainer: max-k <max-k@post.com>

_pkgbase=glew
pkgname=${_pkgbase}1.10
pkgver=1.10.0
pkgrel=1
pkgdesc="The OpenGL Extension Wrangler Library (1.9 branch)"
arch=('i686' 'x86_64')
url="http://glew.sourceforge.net"
license=('BSD' 'MIT' 'GPL')
depends=('libxmu' 'libxi' 'glu' 'glew')
source=(http://downloads.sourceforge.net/${_pkgbase}/${_pkgbase}-${pkgver}.tgz)
sha1sums=('f41b45ca4a630ad1d00b8b87c5f493781a380300')

build() {
  cd ${_pkgbase}-${pkgver}
  
  sed -i 's|lib64|lib|' config/Makefile.linux
  sed -i '/^.PHONY: .*\.pc$/d' Makefile
  make
}

package() {
  cd ${_pkgbase}-${pkgver}
  make GLEW_DEST="${pkgdir}/usr" install.all
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  rm "${pkgdir}"/usr/lib/{libGLEW,libGLEWmx}.{a,so}
  chmod 0755 "${pkgdir}"/usr/lib/libGLEW*.so.${pkgver}

  rm -rf "${pkgdir}"/usr/{bin,include,lib/pkgconfig}
}
