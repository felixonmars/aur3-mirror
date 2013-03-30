# Maintainer: Enric Morales <geekingaround@enric.me>
pkgname=cjdcmd-git
pkgver=20130330
pkgrel=1
pkgdesc="cjdcmd is a command line tool for cjdns."
arch=('i686' 'x86_64')
url="https://github.com/inhies/cjdcmd"
license=('GPL')
depends=('cjdns-git')
makedepends=('git' 'go')
provides=('cjdcmd')

_gitroot=github.com/inhies/cjdcmd
_gitname=cjdcmd

build() {
  GOPATH="$srcdir" go get -v -fix -x $_gitroot
}

package() {
  mkdir -p ${pkgdir}/usr/bin/
  install -m755 ${srcdir}/bin/cjdcmd ${pkgdir}/usr/bin/cjdcmd
}

# vim:set ts=2 sw=2 et:
