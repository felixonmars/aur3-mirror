# $Id: PKGBUILD,v 1.7 2006/05/27 16:40:25 andyrtr Exp $
# Maintainer: eric <eric@archlinux.org>
# Contributor: Manolis Tzanidakis

pkgname=quickswitch
pkgver=1.05
pkgrel=2
pkgdesc="A little utility for creating and using roaming network profiles."
arch=(i686 x86_64)
url="http://muthanna.com/quickswitch"
depends=('perl')
source=(http://dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('3e72649f65ee6eb87f0f8850aa28ca38')

build() {
  cd $startdir/src/$pkgname-$pkgver
  # fix config path
  for f in switcher switchto switchto.conf; do 
    /bin/sed -i "s:/etc/switchto.conf:/etc/quickswitch/switchto.conf:g" $f
  done
  /bin/install -D -m 755 switcher $startdir/pkg/usr/bin/switcher
  /bin/install -D -m 755 switchto $startdir/pkg/usr/bin/switchto
  /bin/install -D -m 644 switchto.conf \
      $startdir/pkg/etc/quickswitch/switchto.conf.examle
}
# vim: ts=2 sw=2 et ft=sh
