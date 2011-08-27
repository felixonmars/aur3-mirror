# Maintainer: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=touchmegames
pkgver=0.2.5
pkgrel=2
pkgdesc="Collection of strategy, card and misc games."
url="http://touchmegames.sourceforge.net/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('gtk2')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz touchmegames-0.2.diff touchmegames.desktop)
md5sums=('e66df2c9b5a3a6dd7fdbd13535acda58' '1fb54c6fc31bfd02d2dabd5d5e65cd2a' 'e590e06a67ef7d8d048adcfb1cebcb7b')

build() {
  cd ${srcdir}/$pkgname-$pkgver
  mkdir -p ${pkgdir}/usr/share/{applications,touchmegames}
  mkdir -p ${pkgdir}/usr/bin
  patch -p1 < ../touchmegames-0.2.diff || return 1
  find src -type f -exec sed -i 's_/usr/local/share/touchmegames/_/usr/share/touchmegames/_g' '{}' \;
  cd src    
  make || return 1
  cp -R {compile4,consume21,dropzone,flogthedolphin,fortresscrackers,fotoseek,foxyboxy,gorillathrilla,images,include,lib,memory,nonogram,secretphrase,sounds,sudoku,template,threescompany,tritowers,videopoker,wordhunt} \
  ${pkgdir}/usr/share/touchmegames
  install -m755 touchmegames ${pkgdir}/usr/bin/
  find "$pkgdir/" -name "*.o" -exec rm -r {} +
  find "$pkgdir/" -name "*.cpp" -exec rm -r {} +
  find "$pkgdir/" -name "*.h" -exec rm -r {} +
  find "$pkgdir/" -name "*.a" -exec rm -r {} + 
  find "$pkgdir/" -name ".*" -exec rm -r {} +
  find "$pkgdir/" -name "Makefile" -exec rm -r {} +
  cp ${srcdir}/touchmegames.desktop ${pkgdir}/usr/share/applications
}
