# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/Arch_CVS_&_SVN_PKGBUILD_guidelines
# for more information on packaging from SVN sources.

# Contributor: Your Name <youremail@domain.com>
pkgname=gearhead2-svn
pkgver=561
pkgrel=1
pkgdesc=""
arch=(i686)
url="http://www.gearheadrpg.com/"
license=('unknown')
groups=()
depends=()
makedepends=('subversion' 'fpc')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_svntrunk=https://gearhead2.svn.sourceforge.net/svnroot/gearhead2 
_svnmod=svn

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  #
  # BUILD
  #
  #./autogen.sh
  #./configure --prefix=/usr
  #make || return 1
  #make DESTDIR="$pkgdir/" install
  cd trunk/
  ppc386 -dASCII gearhead || return 1
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
