# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=xanim
pkgver=2.80.1
pkgrel=6
pkgdesc="A program that can play animations, audio and video of various formats"
arch=('i686' 'x86_64')
url="http://xanim.polter.net/"
license=("custom")
depends=('zlib' 'libxt' 'libxext')
makedepends=('imake' 'xproto')
source=(http://xanim.polter.net/files/xanim2801.tar.gz license.txt)
md5sums=('e2ecd086c160f18dd7cc3cac438758c2'
         '20d297c0f90fbabcd446b89c3f81ff34')

build() {
  cd "${srcdir}/${pkgname}2801"
  xmkmf
  cp docs/xanim.man .
  make INCROOT=/usr/include/X11
}

package() {
  cd "${srcdir}/${pkgname}2801"
  make DESTDIR="${pkgdir}" install install.man
  install -D -m644 "${srcdir}/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
