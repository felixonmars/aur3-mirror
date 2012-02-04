# Contributor: Antonio Bonifati  <antonio punto bonifati a google punto com>
# Maintainer: Antonio Bonifati  <antonio punto bonifati a google punto com>
pkgname=hedgehog
pkgver=2.1.0
_pkgver=2.1
pkgrel=1
pkgdesc="Small embeddable LISP compiler."
url="http://hedgehog.oliotalo.fi/"
arch=('x86_64' 'i686')
license=('LGPLv2.1', 'BSD')
source=("http://hedgehog.oliotalo.fi/download/${pkgname}-${pkgver}.tar.gz")
md5sums=('222f6dce163d5f52489e481b92799a05')

build() {
  cd "${srcdir}/${pkgname}-${_pkgver}"
  mkdir -p o
  cd o
  ../configure linux /usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${_pkgver}/o"
  make prefix="${pkgdir}/usr" install
  install -Dm644 ../LICENSE.BSD "$pkgdir/usr/share/licenses/$pkgname/LICENSE.BSD"
}

# vim:set ts=2 sw=2 et:
