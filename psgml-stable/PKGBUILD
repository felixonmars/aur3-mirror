# Contributor: Víctor Martínez Romanos <vmromanos@gmail.com>
# [Victor]
# Server = http://personales.ya.com/vmromanos/arch/pkgs
pkgname=psgml-stable
_progname=psgml
pkgver=1.2.5
pkgrel=3
pkgdesc="An Emacs major mode for editing SGML documents (stable version)"
depends=('emacs')
makedepends=('emacs' 'sed')
conflicts=('psgml-alpha')
install=psgml.install
url="http://www.lysator.liu.se/projects/about_psgml.html"
license=("GPL")
arch=('i686')
source=(http://www.lysator.liu.se/~lenst/about_$_progname/$_progname-$pkgver.tar.gz)
md5sums=('d4f346b0242035e54860b29d7466b0a2')

build() {
  cd $startdir/src/$_progname-$pkgver
  ./configure --prefix=/usr
  sed 's/prefix = \/usr/prefix = ${DESTDIR}\/usr/' -i Makefile
  make || return 1
  make DESTDIR=$startdir/pkg install
}
