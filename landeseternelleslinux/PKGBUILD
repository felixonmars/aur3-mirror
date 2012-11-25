# Maintainer: celmir <scribecelmir@tuxfamily.org>
pkgname=landeseternelleslinux
pkgver=1.7.0
pkgrel=1
pkgdesc="Fork of Eternal Lands's mmorpg for french speaking players"
arch=('i686' 'x86_64')
url="http://www.landes-eternelles.com"
license=(custom:'eternal_lands_license')
depends=('sdl_net' 'sdl_image' 'cal3d' 'mesa' 'openal' 'libxslt' 'libvorbis' 'gtk2')
install='landeseternelles.install'
source=(http://landes-eternelles.com/client/1700/Client_Sources-1.7.0.tar.bz2
	http://www.landes-eternelles.com/client/1700/Editeur_Sources-1.7.0.tar.bz2
        http://landes-eternelles.com/client/1700/linux/LandesEternellesLinux-1.7.0.tar.bz2
	landeseternelles.desktop
        landeseternelles.png
)
md5sums=('869fb2045b91af22a20a1700542e30dc'
'3f2f18e59dc3e495a77ef0398dad1c5d'
'2cdd59ba1ef6538b988d2e8a6241f5ec'
'34b87dba614b242297375cec98255acf'
'410fed06fca941a95b0427c30cb697c5'
)

build() {
  cd "$srcdir/Client_Sources"
  for fic in Makefile.linux *.h *.c io/*.h io/*.c eye_candy/*.h eye_candy/*.cpp
  do
  sed -e 's#client_sources#Client_Sources#g' -i $fic
  sed -e 's#editeur_sources#Editeur_Sources#g' -i $fic
  done 
  make -f Makefile.linux || return 1
  cd "$srcdir/Editeur_Sources"
  for fic in Makefile.linux *.h *.c *.cpp
  do
  sed -e 's#editeur_sources#Editeur_Sources#g' -i $fic
  sed -e 's#client_sources#Client_Sources#g' -i $fic
  done 
  make -f Makefile.linux || return 1
}

package() {
  mkdir -p $pkgdir/usr/{bin,share/{$pkgname,licenses/$pkgname,pixmaps,applications}}
  install -m644 $srcdir/landeseternelles.desktop $pkgdir/usr/share/applications/landeseternelles.desktop
  install -m644 $srcdir/landeseternelles.png $pkgdir/usr/share/pixmaps/landeseternelles.png
  if [ $CARCH == "x86_64" ];then
  cd "$srcdir/Client_Sources"
  install -m755 le.x86_64.linux.bin $pkgdir/usr/bin/le.$CARCH.linux.bin
  cd "$srcdir/Editeur_Sources"
  install -m755 mapedit.x86_64.linux.bin $pkgdir/usr/bin/mapedit.$CARCH.linux.bin
  else
  cd "$srcdir/Client_Sources"
  install -m755 le.x86.linux.bin $pkgdir/usr/bin/le.x86.linux.bin
  cd "$srcdir/Editeur_Sources"
  install -m755 mapedit.x86.linux.bin $pkgdir/usr/bin/mapedit.x86.linux.bin
  fi
  cd "$srcdir/LandesEternellesLinux"
  rm -f *.bin icon.bmp
  mv -f Licence.txt $pkgdir/usr/share/licenses/$pkgname/
  mv -f * $pkgdir/usr/share/$pkgname/
}

# vim:set ts=2 sw=2 et:
