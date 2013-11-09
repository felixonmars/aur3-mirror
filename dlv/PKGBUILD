# Maintainer: Andrea Rossi <accordioner@gmail.com>
pkgname=dlv
pkgver=20101014
pkgrel=1
pkgdesc="system for disjunctive datalog with constraints, true negation and queries."
arch=('i686' 'x86_64')
url="http://www.dlvsystem.com/dlv/"
license=('custom:proprietary')

[[ $CARCH == x86_64 ]] && _arch='x86-64'
[[ $CARCH == i686 ]] && _arch='i386'

source=("http://www.dlvsystem.com/files/${pkgname}.${_arch}-linux-elf-static.bin")
md5sums=('5df55440031c7060f95d5e881e376378')

package() {
  cd "${pkgdir}"
  install -D -m755 "${srcdir}/dlv.${_arch}-linux-elf-static.bin" "${pkgdir}/usr/bin/dlv"
}


# vim:set ts=2 sw=2 et:
