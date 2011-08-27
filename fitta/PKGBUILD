# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Gabriele Lanaro <gabriele.lanaro@gmail.com>
pkgname=fitta  
pkgver=0.2
pkgrel=1
pkgdesc="Program in pygtk to make and plot statistical fits"
url="http://hartree.altervista.org/fitta"
arch=('i686' "x86_64")
license=('GPL')
depends=(python pygtk python-matplotlib python-scipy)
makedepends=()
conflicts=()
replaces=()
backup=()
#install=
source=("http://hartree.altervista.org/files/$pkgname-$pkgver.tar.gz")
md5sums=('b5260f2963e4a4cec88e911936559f40')
build() {
  cd $startdir/src/$pkgname-$pkgver
  python setup.py install --prefix=/usr --root="$pkgdir" || return 1
}
