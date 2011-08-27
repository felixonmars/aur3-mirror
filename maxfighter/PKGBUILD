# Maintainer: Victor van den Elzen <victor.vde@gmail.com>
pkgname=maxfighter
pkgver=1.0.1
pkgrel=1
pkgdesc="Vertical-scrolling asteroids shoot'em'up."
arch=(x86_64)
url="http://maxfighter.musgit.com/"
license=('GPL' 'CCPL:by-nc-sa')
depends=(mesa sdl sdl_image expat openal libogg libvorbis libpng)
makedepends=(scons)
source=(http://source.musgit.com/files/${pkgname}_${pkgver}.tar.bz2
        http://source.musgit.com/files/mysdl_${pkgver}.tar.bz2)
md5sums=('086b008982666a839d9a293016ec4591'
         '57338c671b01df9636cba1466f05be73')

build() {
  cd "${srcdir}/mysdl_${pkgver}"
  sed "s/CXXFLAGS=\['-march=pentium'\]//" -i SConstruct
  scons dist=1

  cd "${srcdir}"
  ln -sf "${srcdir}/mysdl_${pkgver}" mysdl

  cd "${srcdir}/${pkgname}_${pkgver}"
  sed "s/CXXFLAGS=\['-march=pentium'\]//" -i SConstruct
  sed "s/\(env\.Append(LIBS='ogg')\);/\1\n			env.Append(LIBS='png')/" -i SConstruct

  scons dist=1
}

package() {
  cd "${srcdir}/${pkgname}_${pkgver}/dist/linux/maxfighter"

  # adapted from install.sh
  mkdir -p "${pkgdir}/usr/bin/"
  cp maxfighter "${pkgdir}/usr/bin/maxfighter"
  mkdir -p "${pkgdir}/usr/share/games/maxfighter"
  cp -R resources/* "${pkgdir}/usr/share/games/maxfighter/"
  mkdir -p "${pkgdir}/usr/share/doc/maxfighter"
  cp -R docs/* "${pkgdir}/usr/share/doc/maxfighter/"
  mkdir -p "${pkgdir}/var/games/maxfighter"
  chmod 775 "${pkgdir}/var/games"
  chmod 777 "${pkgdir}/var/games/maxfighter"
}
