# $Id: PKGBUILD 213405 2014-05-23 02:47:32Z eric $
# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=neverball-openhmd-git
pkgver=neverball.1.6.0.r18.gfc1161d
pkgrel=1
pkgdesc="3D game similar to Super Monkey Ball or Marble Madness, with OpenHMD support enabled."
arch=('i686' 'x86_64')
url="http://neverball.org/"
license=('GPL')
depends=('sdl2_ttf' 'libgl' 'libpng' 'libjpeg' 'libvorbis' 'physfs' \
         'hicolor-icon-theme' 'xdg-utils' 'openhmd-git')
makedepends=('mesa')
install=neverball.install
source=('git+https://github.com/Neverball/neverball.git')
sha1sums=('SKIP')

pkgver() {
  cd neverball
 git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}


build() {
  cd neverball
  make DATADIR=/usr/share/neverball LOCALEDIR=/usr/share/locale ENABLE_HMD=openhmd \
    CPPFLAGS="$CPPFLAGS -DNDEBUG" CFLAGS="$CFLAGS"
}

package(){
  cd neverball
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}"/usr/share/{neverball,locale,applications,doc/neverball}
  install -d "${pkgdir}"/usr/share/man/man{1,6}

  install -m755 neverball neverputt mapc "${pkgdir}/usr/bin"
  cp -r locale/* "${pkgdir}/usr/share/locale/"
  cp -r data/* "${pkgdir}/usr/share/neverball/"
  cp -r doc/* "${pkgdir}/usr/share/doc/neverball/"
  install -m644 dist/*.desktop "${pkgdir}/usr/share/applications/"
  install -m644 dist/mapc.1 "${pkgdir}/usr/share/man/man1"
  install -m644 dist/{neverball.6,neverputt.6} "${pkgdir}/usr/share/man/man6"

  for i in 16 24 32 48 64 128 256 512; do
    install -D -m644 dist/neverball_$i.png "${pkgdir}/usr/share/icons/hicolor/${i}x$i/apps/neverball.png"
    install -D -m644 dist/neverputt_$i.png "${pkgdir}/usr/share/icons/hicolor/${i}x$i/apps/neverputt.png"
  done

  chmod -R u=rwX,go=rX "${pkgdir}/usr/share/neverball"
}
