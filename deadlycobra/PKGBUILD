# Maintainer: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=deadlycobra
pkgver=0.7.0
pkgrel=3
pkgdesc="Game similar in gameplay to the classic Nibbles(tm) game."
arch=('i686' 'x86_64')
url="http://deadlycobra.sourceforge.net/"
license=('GPL')
depends=('sdl_mixer' 'sdl_image')
makedepends=('make')
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz \
	snake.diff \
        deadlycobra.desktop)
md5sums=('ee2759f0a2a05e8c53fd91de5291f005' 'cf723bcbb1baf0cd5ec6296bada14b4e' 'cab80fb698ec1069271ea4c4975f9fae')

build() {
  cd ${srcdir}/$pkgname-$pkgver
  patch -p1  < ../snake.diff || return 1
  ./configure --prefix=/usr
  make || return 1
  mkdir -p ${pkgdir}/usr/share/{applications,deadlycobra}
  mkdir -p ${pkgdir}/usr/bin
  cd src  
  install -m755 deadlycobra ${pkgdir}/usr/share/deadlycobra
  cp -R music ${pkgdir}/usr/share/deadlycobra
  cp -R pixmaps ${pkgdir}/usr/share/deadlycobra
  cp -R snaps ${pkgdir}/usr/share/deadlycobra
  cp data* ${pkgdir}/usr/share/deadlycobra
  chmod 777 ${pkgdir}/usr/share/deadlycobra/data*
  echo "#!/bin/bash" >> deadlycobra.sh
  echo "cd /usr/share/deadlycobra/" >> deadlycobra.sh
  echo "./deadlycobra" >> deadlycobra.sh
  install -m755 deadlycobra.sh ${pkgdir}/usr/bin
  install ${srcdir}/deadlycobra.desktop ${pkgdir}/usr/share/applications
}