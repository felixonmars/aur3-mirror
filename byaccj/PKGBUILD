# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer:  <ying@althonx4>
pkgname=byaccj  
pkgver=1.15
pkgrel=1 
pkgdesc="Berkeley yacc with java output"
url="http://byaccj.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL')
depends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://nchc.dl.sourceforge.net/project/byaccj/byaccj/1.15/byaccj1.15_src.tar.gz main.c Makefile)
md5sums=('5ee9959af35f245ac2c4355f85fdf351'
         '2d4d3bf91f926585b18bbcc6ac74262b'
         '460c939fd837c0042d3b83d57a34b1bf')

build() {
  cd $startdir/src/$pkgname$pkgver/src
  cp $startdir/Makefile .
  cp $startdir/main.c .
  make linux || return 1
  mkdir -p $pkgdir/usr/bin/
  cp byaccj $pkgdir/usr/bin
}