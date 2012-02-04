# Maintainer: archtux <antonio.arias99999@gmail.com>

pkgname=getez
pkgver=0.2
pkgrel=1
pkgdesc="GUI for wget"
arch=('i686' 'x86_64')
url="http://getez.sourceforge.net/"
license=('GPL')
depends=('gtk2')
makedepends=('autoconf' 'automake')
optdepends=('wget')
source=(http://downloads.sourceforge.net/sourceforge/getez/$pkgname-$pkgver.tar.gz)
md5sums=('5367a6944834113ac743c059f0264584')

build() {
  cd $srcdir/$pkgname-$pkgver

  ./autogen.sh
  ./configure
  make
  install -Dm755 ./src/getez $pkgdir/usr/bin/getez

 # Desktop icon
   cd $startdir
   install -Dm644 getez.png     $pkgdir/usr/share/pixmaps/getez.png
   install -Dm644 getez.desktop $pkgdir/usr/share/applications/getez.desktop
}
