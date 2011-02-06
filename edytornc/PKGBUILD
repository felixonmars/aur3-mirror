# Contributor: yannsen <ynnsen@gmail.com>
pkgname=edytornc
pkgver=2010.03
pkgrel=7
pkgdesc="A text editor for CNC programmers"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/edytornc/"
license=('GPL')
depends=('qt>=4.6')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/EdytorNC%202010.03/$pkgname-$pkgver.tar.gz)
md5sums=('ec1effe55306f7756f71d6524e5323bb')

build() {
  cd $srcdir/$pkgname
  qmake -unix -o Makefile edytornc.pro
  cd $srcdir/$pkgname/src/
  qmake -unix -o Makefile src.pro
 
  make clean
  make
  }

package() {
  cd "$srcdir/$pkgname"
  install -d $pkgdir/usr/bin/
  install -m755 $srcdir/$pkgname/bin/$CARCH/edytornc $pkgdir/usr/bin/
}

# vim:set ts=2 sw=2 et:
