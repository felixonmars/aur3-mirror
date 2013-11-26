# Maintainer: Steffen Hoenig <mail@steffenhoenig.com>

pkgname=pash-git
pkgver=20131124
pkgrel=1
conflicts=('pash-svn')
pkgdesc="A clone of the Windows PowerShell using Mono"
arch=('i686' 'x86_64')
license=('GPL' 'BSD')
url="http://pash.sourceforge.net/"
depends=('mono')
makedepends=('git')


build() {
  cd $srcdir

# Update the repo, else clone a new one
	if [ -d Pash ]; then
		cd Pash
		git pull
		cd $srcdir
	else
		git clone https://github.com/Pash-Project/Pash/
	fi


  rm -rf $srcdir/build
  cp -ar $srcdir/Pash $srcdir/build
  cd $srcdir/build/Source
  MONO_IOMAP=case 
  xbuild Pash.sln
}

package() {
    mkdir -p $pkgdir/opt/
    mkdir -p $pkgdir/usr/bin
    cp -ar $srcdir/build/Source $pkgdir/opt/Pash
    chmod -R 755 $pkgdir/opt/Pash

    printf "#!/bin/sh
mono /opt/Pash/PashConsole/bin/Debug/Pash.exe
" >> $pkgdir/usr/bin/Pash
    cd $pkgdir/usr/bin
    chmod -x Pash
    ln -s Pash pash
    chmod -R 755 $pkgdir/usr/bin
}
