# Contributor: Vlatko Kosturjak <kost@linux.hr>

pkgname=tftpgui
pkgver=3.1
pkgrel=1
pkgdesc="graphical interactive TFTP server written in Python"
arch=('any')
url="http://code.google.com/p/tftpgui/"
license=('GPL')
depends=('python2' 'tk')
makedepends=('')
_sourcedir=('tftpgui_3_1')
_sourcefile=("$_sourcedir.tar")
source=("http://tftpgui.googlecode.com/files/$_sourcefile")
md5sums=('87781b3be9ef3716af7eec0705920d96')

build() {
  mkdir -p $pkgdir/usr/{bin,src}
  cd $pkgdir/usr/src
  tar xf $startdir/$_sourcefile # && rm $startdir/$_sourcefile
  ln -sf $_sourcedir $pkgname
  # mkdir $pkgname/scans

  cd $pkgdir/usr/bin
  echo '#!/bin/sh' > $pkgname
  echo "cd  /usr/src/$pkgname && python tftpgui.py$*" >> $pkgname
  chmod +x $pkgdir/usr/bin/$pkgname
} 
