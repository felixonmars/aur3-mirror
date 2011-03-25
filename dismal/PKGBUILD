# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=dismal
pkgver=1.4
pkgrel=7
arch=('i686' 'x86_64')
pkgdesc="spreadsheet written in emacs-lisp"
url="http://ritter.ist.psu.edu/dismal/dismal.html"
license=('GPL2')
depends=('emacs')
install=dismal.install
source=(http://acs.ist.psu.edu/dismal/$pkgname-$pkgver.tar.gz)
md5sums=('788bd03650be8034b8dc4a695632d612')

build() {
  cd $srcdir/$pkgname-$pkgver
#  sed -i 's+etags+etags.emacs+' Makefile
  make
  install -d $pkgdir/usr/share/emacs/site-lisp/dismal
  install -m 644 *.elc $pkgdir/usr/share/emacs/site-lisp/dismal
  install -m 644 *.el $pkgdir/usr/share/emacs/site-lisp/dismal
  makeinfo dismal-manual.tex
  for _i in dismal.info*
  do
    install -Dm644 ${_i} $pkgdir/usr/share/info/${_i}
  done
  install -d $pkgdir/usr/bin
  install -s -m 755 timer.bin $pkgdir/usr/bin
}

