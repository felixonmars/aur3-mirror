# Maintainer: nosada <ngsksdt@gmail.com>

pkgname=conoha-vps
_cmdname=conoha
pkgver=20150223.2
pkgrel=2
pkgdesc="CLI-Tool for ConoHa VPS"
arch=("x86_64")
url="https://github.com/hironobu-s/conoha-vps"
_gouri="github.com/hironobu-s/conoha-vps"
license=("MIT")
depends=("go")
makedepends=("mercurial")

build() {
  GOPATH=${srcdir} go get ${_gouri}
  cd ${srcdir}/src/${_gouri}
  GOPATH=${srcdir} make linux
}

package() {
  mkdir -p ${pkgdir}/usr/bin
  install -p -m755 ${srcdir}/src/${_gouri}/bin/linux/${_cmdname} ${pkgdir}/usr/bin/${_cmdname}
}

# vim:set ts=2 sw=2 et:
