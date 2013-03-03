# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=qsifre
pkgver=2.0
pkgrel=2
pkgdesc="QSifre is a simple and easy to use password management tool. Database stored with aes256 encryption."
arch=('i686' 'x86_64')
url="http://qsifre.sourceforge.net/"
license=('LGPL 2.1')
depends=('qt4')
source=(http://downloads.sourceforge.net/qsifre/qsifre20src.tar.gz
        $pkgname.desktop)
md5sums=('828febc3bd52e6ca25a37dee8bb653f2'
         '19a08006d19eab51b34c9d8f69697e06')

build() {
  cd $srcdir/$pkgname

  qmake-qt4
  make
}

package() { 
  cd $srcdir/$pkgname 

  cd bin
  install -Dm755 qsifre $pkgdir/usr/bin/qsifre
  mkdir -p $pkgdir/usr/share/QSIFRE/images
  cp images/* $pkgdir/usr/share/QSIFRE/images

  # Desktop icon
  install -Dm644 ../images/qsifreon.png $pkgdir/usr/share/pixmaps/$pkgname.png
  install -Dm644 $startdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}
