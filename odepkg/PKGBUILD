# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: L.G. Sarmiento <Luis.Sarmientop-ala-nuclear.lu.se>
pkgname=odepkg
pkgver=0.8.2
pkgrel=1
pkgdesc="A package for solving ordinary differential equations and more."
url="http://octave.sourceforge.net/odepkg/index.html"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('octave')
source=(http://downloads.sourceforge.net/octave/${pkgname}-${pkgver}.tar.gz)
md5sums=('fb31d7376fae74eeec846b7b3d2bf635')
build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install
}
