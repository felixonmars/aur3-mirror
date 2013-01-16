# Maintainer: TDY <tdy@archlinux.info>

pkgname=lame-extras
pkgver=3.99.5
pkgrel=1
pkgdesc="Supplementary wrappers for LAME (auenc, lameid3, mlame, and mugeco)"
arch=('any')
url="http://lame.sourceforge.net/"
license=('LGPL')
depends=('lame' 'perl-mp3-info')
provides=('mlame=3.99.5')
conflicts=('mlame')
install=$pkgname.install
source=(http://downloads.sourceforge.net/${pkgname/-*}/${pkgname/-*}-$pkgver.tar.gz)
md5sums=('84835b313d4a8b68f5349816d33e07ce')

package() {
  cd "$srcdir/${pkgname/-*}-$pkgver/misc"
  sed -i '1i\#!/usr/bin/env perl' lameid3.pl
  sed -n '9,18s,#[ ]*,,p' <lameid3.pl >lameid3.txt
  install -Dm755 lameid3.pl "$pkgdir/usr/bin/lameid3"
  install -Dm644 lameid3.txt "$pkgdir/usr/share/doc/lame-extras/README.lameid3"
  install -Dm755 auenc "$pkgdir/usr/bin/auenc"
  install -Dm755 mlame "$pkgdir/usr/bin/mlame"
  install -Dm755 mugeco.sh "$pkgdir/usr/bin/mugeco"
}

# vim:set ts=2 sw=2 et:
