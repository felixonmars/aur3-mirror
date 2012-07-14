# Maintainer: Jason Ryan <jasonwryan@gmail.com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>

pkgname=cbzone
pkgver=2.0c
pkgrel=1
pkgdesc="Classical Unix version of the Battlezone game"
arch=('i686' 'x86_64')
url="http://happypenguin.org/show?Cbzone"
license=('custom')
depends=('libxext' 'libxt')
makedepends=('imake')
source=("http://ftp.twaren.net/Sun/sunfreeware.com/i386/5.5/server.berkeley.edu/${pkgname}.tar.gz"
        "COPYING")
md5sums=('ed5630eacf85136837175fa33d6921f0'
         'd41eac8f578fbd5d1505aeb244d59294')

build() {
  cd "${srcdir}/${pkgname}"
  sed -i 's_/usr/ucbinclude/__g' c_includes.h
  sed -i 's_BINDIR = /usr/local/games/_BINDIR = /usr/bin/_g' Imakefile
  sed -i 's_TANKDIR = /usr/local/games/lib/cbzone/_TANKDIR = /usr/share/cbzone/_g' Imakefile
  sed -i 's_-L/usr/ucblib -lucb__g' Imakefile
  xmkmf -a || return 1
  make cbzone || return 1
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${pkgname}.help" "${pkgdir}/usr/share/${pkgname}/${pkgname}.help"
  install -Dm644 "${pkgname}.motd" "${pkgdir}/usr/share/${pkgname}/${pkgname}.motd"
  install -Dm644 "../COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

# vim:set ts=2 sw=2 et:
