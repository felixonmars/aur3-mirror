# Contributor: Víctor Martínez Romanos <vmromanos@gmail.com>
# [Victor]
# Server = http://personales.ya.com/vmromanos/arch/pkgs
pkgname=psgml-alpha
_progname=psgml
pkgver=1.3.2
pkgrel=3
pkgdesc="An Emacs major mode for editing SGML documents (alpha version)"
depends=('emacs')
makedepends=('emacs' 'sed')
conflicts=('psgml-stable')
install=psgml.install
url="http://www.lysator.liu.se/projects/about_psgml.html"
license=("GPL")
arch=('i686')
source=(ftp://ftp.lysator.liu.se/pub/sgml/ALPHA/$_progname-$pkgver.tar.gz)
md5sums=('63a287e2fb4e9987b1c236f7cf508abb')

build() {
  cd $startdir/src/$_progname-$pkgver
  ./configure --prefix=/usr
  sed 's/prefix = \/usr/prefix = ${DESTDIR}\/usr/' -i Makefile
  make || return 1
  make DESTDIR=$startdir/pkg install
}
