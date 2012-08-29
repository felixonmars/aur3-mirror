# Maintainer: DeedleFake <yisszev at beckforce dot com>

pkgname=graphcalc
pkgver=0.0.1
pkgrel=2
pkgdesc="An all-in-one solution to everything from everyday arithmetic to derivatives."
arch=(i686 x86_64)
url="http://www.graphcalc.com"
license=('GPL2')
depends=(qt3 ginac)
source=(http://downloads.sourceforge.net/project/gcalc/gcalc-linux/$pkgver/$pkgname-$pkgver.tar.bz2
        graphcalc.desktop)
sha1sums=('e9976db0d8e48e5464ca0ef28f695afea9360778'
          '3ac62a95d773a3e490ef556c1eeffd2096784db6')

build() {
  cd "$srcdir/$pkgname/linux"
  /opt/qt/bin/qmake
  make SUBLIBS="-lGL"
}

package() {
  cd "$srcdir"
  install -m644 -D graphcalc.desktop "$pkgdir/usr/share/applications/graphcalc.desktop"

  cd "$srcdir/$pkgname/linux"
  install -m755 -D graphcalc "$pkgdir/usr/bin/graphcalc"

  cd "$srcdir/$pkgname"
  mkdir -p "$pkgdir/usr/share/doc/$pkgname"
  cp -a INSTALL FAQ "$pkgdir/usr/share/doc/$pkgname"
}

# vim:set ts=2 sw=2 et:
