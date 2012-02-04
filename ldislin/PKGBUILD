# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer:  <ying@althonx4>
pkgname=ldislin  
pkgver=0.10
pkgrel=1 
pkgdesc="The lua binding of dislin graphic library"
url="http://ldislin.luaforge.net/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('dislin' 'lua')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://files.luaforge.net/releases/ldislin/ldislin/ldislin-10/ldislin-10.tar.gz 'Makefile' 'processh.lua' 'ldislin.c')
md5sums=('7fa414ff95aa916b2dd8188bfdf48c56'
         '774b751ba8912c5afcedb3da860e12dc'
         '5ac6cc1a3e987503e78cbc38a3484ff6'
         '9bd4584e2da421259d6c56bd5e63c356')
build() {
  cd $startdir
  cp Makefile processh.lua ldislin.c $startdir/src/$pkgname-10
  cd $startdir/src/$pkgname-10
  make -s 2>/dev/null
  mkdir -p $pkgdir/usr/lib/lua/5.1
  install ldislin.so $pkgdir/usr/lib/lua/5.1
 }