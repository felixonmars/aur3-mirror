# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Gu, Cong <gucong43216@gmail.com>
pkgname=schemik  
pkgver=1.2.40.0
pkgrel=1 
pkgdesc="an implicitly-parallel dialect of Scheme, this means the parallel execution of programs is done independently of the programmer"
url="http://schemik.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gc' 'glib2')
makedepends=('scons')
optdepends=('readline')
source=(http://superb-sea2.dl.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('55daf56686952c2667d9427a7eb7a3ec')
build() {
  cd $startdir/src/$pkgname-$pkgver
  scons prefix=/usr || return 1
  scons install prefix=${pkgdir}/usr || return 1
}