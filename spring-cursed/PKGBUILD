# Maintainer: Thomas Weißschuh <thomas_weissschuh || lavabit || com>

pkgname=spring-cursed
pkgver=1.20
_filename="the_cursed-${pkgver}.sdz"
_licensefile="info_and_license.txt"
pkgrel=1
pkgdesc="Spring engine mod about bones, undead, demons, space marines and magic settled in a futuristic environment"
arch=(any)
url="http://azaremoth.supremedesign.org/"
license=("custom")
depends=('spring')
optdepends=("spring-cursed: Maps to play")
source=("http://api.springfiles.com/files/games/${_filename}")
noextract=("${_filename}")

build() {
  cd ${srcdir}
  bsdtar -x -f ${_filename} --include "${_licensefile}"
}

package(){
  mkdir -p ${pkgdir}/usr/share/spring/mods/
  mkdir -p ${pkgdir}/usr/share/licenses/"${pkgname}"
  cp ${srcdir}/${_filename} ${pkgdir}/usr/share/spring/mods/
  cp ${srcdir}/${_licensefile} ${pkgdir}/usr/share/licenses/"${pkgname}"
}
sha1sums=('c24c82e08524537fdde3de2993cba41f3120b657')

# vim: sw=2:ts=2 et:
