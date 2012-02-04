# Maintainer: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=opengf
pkgver=1.2rc2
pkgrel=2
pkgdesc="Learn music the easy way"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/opengf/"
license=('GPL')
depends=('sdl_mixer' 'sdl_image' 'sdl_ttf')
source=(http://downloads.sourceforge.net/opengf/OpenGF-RC2-1.1-Linux.tar.gz opengf.desktop note_generator.diff)
md5sums=('dcd0094db94b594a3f81b913f867c4a4' 'd5f37ff4c0447cfbb859bee429f3563e' '870140d81b6712f24622db770d021365')

build() {
  cd ${srcdir}/OpenGF-RC2-1.2-Linux
  patch -p0 < ${srcdir}/note_generator.diff || return 1
  cd bin  
  make || return 1
  mkdir -p $pkgdir/usr/share/{applications,opengf}
  mkdir -p $pkgdir/usr/bin
  cp OpenGF $pkgdir/usr/share/opengf
  cp -R data $pkgdir/usr/share/opengf
  cp -R config $pkgdir/usr/share/opengf
  echo "#!/bin/bash" >> opengf.sh
  echo "cd /usr/share/opengf/" >> opengf.sh
  echo "./OpenGF" >> opengf.sh
  cp opengf.sh $pkgdir/usr/bin
  chmod 755 $pkgdir/usr/bin/opengf.sh
  cp $srcdir/opengf.desktop $pkgdir/usr/share/applications
}
