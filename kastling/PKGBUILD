pkgname=kastling
pkgver=0.9.5
pkgrel=1
pkgdesc="Free chess interface written in Qt. It supports playing on 
Fics."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/kastling/"
license=('GPL3')
depends=('qt')
source=("http://sourceforge.net/projects/$pkgname/files/$pkgname-$pkgver-src.tar.gz" "kastling.desktop")
md5sums=('81a7dc7b9dc81984c0d97de74022c401' 'a5255b7d726fd616d37e179c974cf24b')
build() {
  cd $srcdir/$pkgname-$pkgver-src

# Compile
  qmake
  make

  # Install
  mkdir -p $pkgdir/usr/share/$pkgname
  cp -R themes/ kastling  $pkgdir/usr/share/$pkgname
  install -D -m 755 $startdir/kastling $pkgdir/usr/bin/kastling
  install -D -m 644 $startdir/$pkgname.desktop $pkgdir$installdir/games/$pkgname.desktop
}
