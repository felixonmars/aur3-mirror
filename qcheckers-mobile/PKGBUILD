# Maintainer: archtux <antonio.arias99999@gmail.com>

pkgname=qcheckers-mobile
pkgver=0.2
pkgrel=1
pkgdesc="Checkers for Qt(Russian and international)"
arch=('i686' 'x86_64')
url="http://qt-apps.org/content/show.php/QCheckers+Mobile?content=135452&PHPSESSID=d6f980ba940ceabc9ae562687254a2c1"
license=('GPL3')
depends=('qt')
source=(http://qcheckersmobile.googlecode.com/files/qcheckersmobile_0.2_src_rev8.zip)
md5sums=('34d4f1cedc1bf9f4854d464c6e9a99bc')

build() {
  cd $srcdir/qcheckersmobile

   qmake
   make
   install -Dm755 QCheckers $pkgdir/usr/bin/qcheckers

   # Desktop icon
   install -Dm644 qcheckers.svg $pkgdir/usr/share/pixmaps/qcheckers.svg
   install -Dm644 $startdir/qcheckers.desktop $pkgdir/usr/share/applications/qcheckers.desktop
}