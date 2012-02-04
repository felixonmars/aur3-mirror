# Maintainer: Carlos Eduardo Moreira dos Santos <cems@cemshost.com.br>
pkgname=foo2hp
pkgver=20091106
pkgrel=1
pkgdesc='a linux printer driver for ZjStream protocol e.g. HP Color LaserJet 1600/2600n'
arch=('i686' 'x86_64')
url="http://foo2hp.rkkda.com/"
license=('GPL')
depends=('foomatic-filters' 'ghostscript')
makedepends=('unzip')
install=$pkgname.install
source=(http://cadu.santos.nom.br/archlinux/foo2zjs$pkgver.tar.gz)
md5sums=('1e664a4e9847df7f440e31523773e2dd')

build() {
  cd $srcdir
  patch foo2zjs/Makefile ../Makefile.patch
  mkdir -p $pkgdir/usr/bin $pkgdir/bin $pkgdir/usr/share/foomatic/db/source/opt $pkgdir/usr/share/ppd $pkgdir/usr/share/cups/model $pkgdir/usr/share/applications $pkgdir/usr/share/pixmaps $pkgdir/usr/share/gnome/apps/System
  cd $srcdir/foo2zjs
  make || return 1
  $startdir/selectPrinters
  make DESTDIR=$pkgdir install || return 1
}
