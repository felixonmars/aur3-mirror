# Maintainer: Jens Staal <staal1978@gmail.com>

pkgname=pash-svn
pkgver=20110530
pkgrel=1
pkgdesc="A clone of the Windows PowerShell using Mono"
arch=('i686' 'x86_64')
license=('GPL' 'BSD')
url="http://pash.sourceforge.net/"
depends=('mono')
makedepends=('subversion')


build() {
  cd $srcdir

# Update the repo, else clone a new one
	if [ -d pash ]; then
		cd pash
		svn up
		cd $srcdir
	else
		svn co https://pash.svn.sourceforge.net/svnroot/pash pash
	fi


  rm -rf $srcdir/build
  cp -ar $srcdir/pash $srcdir/build
  cd $srcdir/build/trunk/Pash
  MONO_IOMAP=case 
  xbuild Pash.sln
}

package() {
    mkdir -p $pkgdir/opt/
    mkdir -p $pkgdir/usr/bin
    cp -ar $srcdir/build/trunk/Pash $pkgdir/opt/Pash
    chmod -R 755 $pkgdir/opt/Pash

    printf "#!/bin/sh
mono /opt/Pash/PashConsole/bin/Debug/Pash.exe
" >> $pkgdir/usr/bin/Pash
    cd $pkgdir/usr/bin
    chmod -x Pash
    ln -s Pash pash
    chmod -R 755 $pkgdir/usr/bin
}
