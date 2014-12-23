# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=chibitracker
pkgver=1.2
pkgrel=3
pkgdesc="A portable Impulse Tracker clone."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/chibitracker.berlios/"
license=('GPL2')
depends=('sdl')
makedepends=('scons' 'unzip')
source=(http://sourceforge.net/projects/$pkgname.berlios/files/$pkgname-$pkgver.tar.gz
        $pkgname-1.1-amd64.patch
        $pkgname.desktop
        $pkgname.sh)
md5sums=('1dfd7c4b7ffbc7d1377393d040cd5433'
         'c814ecb20737afaa10100ccaa78db1bf'
         'e344dc00895a2d3760f68fa448a79a5d'
         'd89671948da85245d25838db736d5070')

prepare() {         
  cd $srcdir/$pkgname-$pkgver
  if [ "$CARCH" = "x86_64" ]; then
     patch -Np0 -i $srcdir/$pkgname-1.1-amd64.patch
  fi

  cd skins
  for x in *.zip; do unzip -q $x && rm $x; done
}

build() {
  cd $srcdir/$pkgname-$pkgver
  scons prefix=/usr
}

package() {
  cd $srcdir/$pkgname-$pkgver

  # Skins
  install -d $pkgdir/usr/share/$pkgname/skins
  for x in skins/*; do
      install -d $pkgdir/usr/share/$pkgname/$x
      install -m644 $x/* $pkgdir/usr/share/$pkgname/$x
  done

  # Binary
  install -m755 program/$pkgname $pkgdir/usr/share/$pkgname

  # Desktop file
  install -Dm644 program/cticon.png $pkgdir/usr/share/pixmaps/$pkgname.png
  cd ..
  install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

  # Start file
  install -Dm755 $pkgname.sh $pkgdir/usr/bin/$pkgname
}