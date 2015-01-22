#
# Python interpreter for the esoteric language ><>.
# Original code available on https://gist.github.com/anonymous/6392418
# DISCLAIMER: I did not write this program, it is only packaged by me.
#             The original code was created by a user named Harpyon.
# 
# Maintainer: Samuel Čavoj <sammko@sammserver.com>
#

pkgname=fish-interpreter
pkgver=1.0
pkgrel=1
pkgdesc="Python interpreter for the esoteric language ><>."
arch=('any')
license=('MIT')
depends=('python')
provides=('fish-interpreter')
source=("https://sammserver.com/src/fish-interpreter-1.0.tar.gz")
url="http://esolangs.org/wiki/Fish"

package() {
  install -D -m 755 "${srcdir}/${pkgname}/fish" "${pkgdir}/usr/bin/fish" 
}
md5sums=('3fca7606a6583cb03ddcd76648d9b815')
