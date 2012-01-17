# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: cantabile <cantabile dot desu at gmail dot com>
# Contributor: Christoph Zeiler <rabyte*gmail>

pkgname=linwarrior
pkgver=20101231
pkgrel=1
pkgdesc="A somewhat classical open source Mech Simulation game"
arch=('i686' 'x86_64')
url="http://www.hackcraft.de/games/linwarrior_3d/"
license=('custom')
depends=('glew' 'freealut' 'sdl')
makedepends=('sed' 'findutils')
source=("http://www.hackcraft.de/games/linwarrior_3d/downloads/${pkgname}_${pkgver}.tar.gz")
md5sums=('ba7b8a8dd4007f9aa9b2d481f47dc794')

build() {
  cd "${srcdir}/${pkgname}"
  sed -i "s_data/_/usr/share/$pkgname/data/_g" source/{cBackground,cBuilding,cPlanetmap,cMech,cWeapon,main}.cpp
  sed -i "s_-lGLU_-lGL -lGLU_g" Makefile
  make || return 1
}

package() {
  cd "${srcdir}/${pkgname}"

  # install binary
  install -Dm755 "dist/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # just to be sure
  find data/ -type d -exec chmod 755 '{}' \;
  # there's no reason for data files to be executable
  find data/ -type f -exec chmod 644 '{}' \;
  # install the data
  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  cp -r data "${pkgdir}/usr/share/${pkgname}/"

  # install license and readme
  install -Dm644 doc/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  install -Dm644 doc/README "${pkgdir}/usr/share/doc/${pkgname}/README"
}

# vim:set ts=2 sw=2 et:
