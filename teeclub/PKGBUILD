# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=teeclub
pkgver=0.1
pkgrel=2
pkgdesc="A command-line implementation of the Tee Club patience card game"
arch=('any')
url="http://uazu.net/freeware/teeclub/"
license=('GPL' 'PerlArtistic')
depends=('perl')
source=("http://uazu.net/freeware/${pkgname}/${pkgname}.tgz")
md5sums=('f85c62dfbce9fc814b0671e377796000')

package() {
  cd "${srcdir}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
