# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=vstruct
pkgver=1.0.1
pkgrel=1
pkgdesc="A Lua library for packing and unpacking binary data."
arch=('i686' 'x86_64')
url="http://www.funkyhorror.net/toxicfrog/projects/vstruct/"
license=('MIT')
depends=('lua')
conflicts=('vstruct-git')
source=(http://github.com/ToxicFrog/vstruct/tarball/v${pkgver})
md5sums=('8e49ba710cbb79ab3d2c8db59fe47bff')

build() {
  cd ${srcdir}/ToxicFrog-vstruct*
  mkdir -p ${pkgdir}/usr/lib/lua/5.1/vstruct/
  cp *.lua ${pkgdir}/usr/lib/lua/5.1/vstruct/
  install -D -m644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
