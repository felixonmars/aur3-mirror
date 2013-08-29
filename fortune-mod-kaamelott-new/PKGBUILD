# Maintainer: TheMagicBanana
pkgname=fortune-mod-kaamelott-new
pkgver=3
pkgrel=1
url=('https://fr.wikiquote.org/wiki/Kaamelott')
pkgdesc="Quotes from the French comedy show Kaamelott."
license=('CCPL')
arch=('any')
depends=('fortune-mod')
makedepends=('coreutils')
conflicts=('fortune-mod-kaamelott')
source=("kaamelott")
md5sums=('c3fbf06c3a996315d82b55234575d4c9')

build() {
  cd ${srcdir}
  mkdir -p ${srcdir}/src/usr/share/fortune
  fold -w 80 -s kaamelott > \
      ${srcdir}/src/usr/share/fortune/kaamelott || exit 1
  strfile -r ${srcdir}/src/usr/share/fortune/kaamelott || exit 2
}

package(){
    mkdir -p ${pkgdir}/usr/share/fortune
    cp ${srcdir}/src/usr/share/fortune/kaamelott ${pkgdir}/usr/share/fortune
    cp ${srcdir}/src/usr/share/fortune/kaamelott.dat ${pkgdir}/usr/share/fortune
}

# vim:set ts=2 sw=2 et:
