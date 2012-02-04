# Contributor: Tarinaky <tarinaky@hunity.co.uk>
pkgname=gearhead2
pkgver=0628
pkgrel=1
pkgdesc="GearHead2 is a giant robot roguelike role playing game set five years after the events of GH1. Features include random plot generation, detailed character creation, tactical/RPG modes, graphical/ASCII interfaces, and many kinds of mecha to play with."
arch=('i686' 'x86_64')
url="http://www.gearheadrpg.com/"
license=('unknown')
groups=()
depends=()
makedepends=('fpc')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://downloads.sourceforge.net/project/gearhead2/gearhead2/0.628/gh2-0628-source.zip)
noextract=()


build() {
  cd "$srcdir"
  #
  # BUILD
  #
  #./autogen.sh
  #./configure --prefix=/usr
  #make || return 1
  #make DESTDIR="$pkgdir/" install
  cd GH2

  if test $CARCH == "x86_64" ; then
	  ppcx64 -dASCII gearhead || return 1
  else
	  ppc386 -dASCII gearhead || return 1
  fi

  mkdir -p $pkgdir/usr/share/GH2/
  mv * $pkgdir/usr/share/GH2/

  echo "#!/bin/bash" > $pkgdir/usr/share/GH2/start-gearhead
  echo "cd /usr/share/GH2/ || return 1" >> $pkgdir/usr/share/GH2/start-gearhead
  echo "exec ./gearhead" >> $pkgdir/usr/share/GH2/start-gearhead
  chmod g+x $pkgdir/usr/share/GH2/start-gearhead
  mkdir -p $pkgdir/usr/bin
  cp -l $pkgdir/usr/share/GH2/start-gearhead $pkgdir/usr/bin/gearhead

  mkdir -p $pkgdir/usr/share/GH2/savegame/
  
  chgrp -R games $pkgdir/usr/share/GH2/
  chmod -R g+rw $pkgdir/usr/share/GH2/*
}
md5sums=('ff5f49f02d654302e96e813242daebb6')
