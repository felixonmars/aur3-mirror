# Maintainer: Dany Martineau <dany.luc.martineau at gmail.com>

pkgname=2h4u
pkgver=1.3
pkgrel=4
pkgdesc="Mix between a Tetris-like game and a wall breaker"
url="https://sourceforge.net/projects/toohardforyou"
license=('GPL')
arch=('i686' 'x86_64')  
depends=('sdl_ttf' 'sdl_mixer' 'sdl_image' 'gcc-libs')
source=('http://downloads.sourceforge.net/toohardforyou/2H4U-1.3_SOURCES.tar.gz' '2h4u.desktop')
md5sums=('e5a4b473c8f7cc3ed4acdf29513d6ab9' '3cee1166823eec807a765bf1f6e71d5a')
install=(2h4u.install)

build() {
  cd ${srcdir}/2H4U/scripts
  make
  cd ..
  install -d ${pkgdir}/usr/share/{2h4u,applications}
  cp -R 2H4U aide data help ${pkgdir}/usr/share/2h4u/
  mkdir -p ${pkgdir}/usr/bin
  echo "#!/bin/sh\ncd '/usr/share/2h4u' && ./2H4U" > ${pkgdir}/usr/bin/2h4u
  chmod a+x ${pkgdir}/usr/bin/2h4u
  install ${srcdir}/2h4u.desktop ${pkgdir}/usr/share/applications
}
