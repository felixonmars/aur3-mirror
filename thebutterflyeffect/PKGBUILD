# Maintainer: Frosthammer <frosthammer@frosthammer.de>

pkgname=thebutterflyeffect
pkgver=m8.2
pkgrel=1
pkgdesc="A logic game in the style of The Incredible Machine"
arch=('i686' 'x86_64')
url="http://sourceforge.net/apps/trac/tbe/wiki/WikiStart"
license=('GPL')
depends=('qt')
source=(http://sourceforge.net/projects/tbe/files/Milestone%208.2/TheButterflyEffect-${pkgver}.src.tgz
        thebutterflyeffect.desktop
        thebutterflyeffect.sh)
md5sums=('a35543bbcca5ade0dc0dfde712411339'
         'b8857478077c3c0ece3701ccc2776765'
         'd2fbc2241f91c873f375eaca2dc138c0')

build() {
  cd $srcdir/TheButterflyEffect-$pkgver
  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd ${srcdir}/TheButterflyEffect-$pkgver
  install -Dm 755 tbe $pkgdir/usr/share/thebutterflyeffect/tbe
  install -Dm 755 $srcdir/thebutterflyeffect.sh $pkgdir/usr/bin/thebutterflyeffect
  cp -r {levels,images} $pkgdir/usr/share/thebutterflyeffect/
  install -Dm 644 $srcdir/thebutterflyeffect.desktop $pkgdir/usr/share/applications/thebutterflyeffect.desktop
}
