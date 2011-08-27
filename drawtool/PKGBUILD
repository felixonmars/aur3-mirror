# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: perlawk
pkgname=drawtool
pkgver=3.2.2
pkgrel=1 
pkgdesc="Drawtool is a simple application that reads in simple vector geometry from stdin and displays it in a gtk window." 
url="http://www.earth.li/projectpurple/progs/drawtool.html"
arch=(`arch`)
license=('BSD')
depends=('imlib')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://www.earth.li/projectpurple/files/$pkgname-$pkgver.tar.gz
plot.patch macromenu.patch events.patch)
md5sums=('97ffd36c555d67f58fa50615afc28772'
         '8b19e4319827612429034107f17a5d1a'
         '9b5410f4ab034ecc541079d4531a5b8f'
         'fe801de70bf8f9c6df41d93e718cd413')
build() {
  cd $startdir/src/$pkgname-$pkgver
  cd src
  patch -p1 plot.c < $startdir/plot.patch
  patch -p1 macromenu.c < $startdir/macromenu.patch
  patch -p1 events.c < $startdir/events.patch
  cd ../
  make || return 1
  install -d $pkgdir/usr/bin $pkgdir/usr/share/drawtool/
  install -t $pkgdir/usr/bin src/drawtool logo/logo
  install -t $pkgdir/usr/share/drawtool sample.drawtoolrc 
  cp -a macros $pkgdir/usr/share/drawtool/
  cp -a docs $pkgdir/usr/share/drawtool/
  cp -a psdrawtool $pkgdir/usr/share/drawtool/
  cp -a perltool $pkgdir/usr/share/drawtool/
  cp -a utils $pkgdir/usr/share/drawtool/
  cp -a svgdrawtool $pkgdir/usr/share/drawtool/
}

