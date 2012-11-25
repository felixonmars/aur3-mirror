# Maintainer: Anntoin Wilkinson <anntoin@gmail.com>
# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=a7xpg
pkgver=0.11
pkgrel=5
pkgdesc="An addictive game by Kenta Cho.  Collect gold with your ship and avoid the enemies!"
arch=('i686' 'x86_64')
url="http://www.asahi-net.or.jp/~cs8k-cyu/windows/a7xpg_e.html"
license=('custom')
depends=('libgl' 'sdl_mixer')
makedepends=('gdc1')
source=(http://www.asahi-net.or.jp/~cs8k-cyu/windows/${pkgname}0_11.zip
        http://ftp.de.debian.org/debian/pool/main/a/${pkgname}/${pkgname}_${pkgver}.dfsg1-7.debian.tar.gz)
md5sums=('3280918840913d629b13dc02bcbbfa7d'
         '88c2919c92379e1104a37d66ad57b929')
_patchdir="${srcdir}/debian/patches/"

build() {
  cd ${srcdir}/${pkgname}

  cat ${_patchdir}series | egrep -v '^#|^\ #' | sed "s:^:${_patchdir}:" | xargs -n1 patch -p1 -i

  sed -i 's:/games::g' ./src/abagames/util/sdl/{Sound,Texture}.d
  sed -i 's:gdmd-v1:gdmd1:' Makefile
  sed -i 's:gdc-v1:gdc1:' Makefile

  make
}

package() {
  cd ${srcdir}/${pkgname}

  # Install binaries
  install -D -m755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}

  # Install other resources
  find {images,sounds} -type f -exec install -Dm644 {} ${pkgdir}/usr/share/${pkgname}/{} \;

  # Install man page and debian copyright notice
  install -D -m644 ../debian/${pkgname}.6 ${pkgdir}/usr/share/man/man6/${pkgname}.6
  install -D -m644 ../debian/copyright ${pkgdir}/usr/share/licenses/${pkgname}/copyright

  # Install desktop file and icon
  install -D -m644 ../debian/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
  install -D -m644 ../debian/${pkgname}.xpm ${pkgdir}/usr/share/pixmaps/${pkgname}.xpm
}

# vim:set ts=2 sw=2 et:
