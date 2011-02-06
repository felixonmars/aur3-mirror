# Maintainer: avanzzzi (avanzzzi at gmail dot com)
pkgname=fortune-mod-simpsons-chalkboard
pkgver=0
pkgrel=2
pkgdesc="Fortune cookies: Collection of Bart Simpson's chalkboard-writings."
arch=('any')
license=('unknown')
depends=(fortune-mod)
url="http://www.splitbrain.org/projects/fortunes/simpsons"
source=(http://www.splitbrain.org/_media/projects/fortunes/fortune-simpsons-chalkboard.tgz)
md5sums=('1602ec6df3336a7e01f857b8419c8df1')

build(){
  cd ${srcdir}/fortune-simpsons-chalkboard

  install -d ${pkgdir}/usr/share/fortune || return 1
  install -m644 chalkboard* ${pkgdir}/usr/share/fortune || return 1
}
