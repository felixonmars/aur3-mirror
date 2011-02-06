# Maintainer:  Federico Manganelli <mangus@deprecated.it>
# Contributor: mangus <mangus@deprecated.it>

pkgname=qnokiacommander
pkgver=0.5
pkgrel=2
pkgdesc="A pyqt4 obexftp frontend for nokia phones"
arch=('i686' 'x86_64')
url="http://www.deprecated.it/download/"
license=('GPL')
depends=('pyqt' 'obexftp')
source=(http://www.deprecated.it/download/QNokiaCommander-0.5.tar.bz2)
md5sums=('888e1a350ff767d17ec127f43c80cf1e')


build() {
  cd $startdir/src
  mkdir -p $startdir/pkg/usr/share/qnokiacommander
  mkdir -p $startdir/pkg/usr/bin
  mkdir -p $startdir/pkg/usr/share/applications/
  cp -r $startdir/src/QNokiaCommander-0.5/* $startdir/pkg/usr/share/qnokiacommander/
  rm   $startdir/pkg/usr/share/qnokiacommander/qnokiacommander
  cp -r $startdir/src/QNokiaCommander-0.5/qnokiacommander $startdir/pkg/usr/bin/
  cp -r $startdir/src/QNokiaCommander-0.5/qnokiacommander.desktop $startdir/pkg/usr/share/applications/
  chmod +x $startdir/pkg/usr/bin/qnokiacommander
}

