# Contributor: dimino jeremie <jeremie@dimino.org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-ocaml-mode
pkgver=3.11.2
pkgrel=1
pkgdesc="Emacs mode for ocaml"
arch=('i686' 'x86_64')
url="http://caml.inria.fr/"
depends=('emacs')
source=(http://caml.inria.fr/distrib/ocaml-3.11/ocaml-$pkgver.tar.gz)
md5sums=('9d0611245122ffbc8263735cae1da7fb')
license=('custom:Q')
install=emacs-ocaml-mode.install
conflicts=(emacs-tuareg-mode)

build() {
  cd $srcdir/ocaml-$pkgver
  ./configure -prefix /usr || return 1
  install -Dm644 LICENSE \
    $pkgdir/usr/share/licenses/emacs-ocaml-mode/LICENSE || return 1
  cd emacs 
  # string-to-int is obsolete in emacs 22.1
  sed -i 's/string-to-int/string-to-number/g' * || return 1
  make EMACSDIR=$pkgdir/usr/share/emacs/site-lisp install || return 1
  cd ../man || return 1
  for _i in *.m
  do
    install -Dm644 ${_i} $pkgdir/usr/share/man/man1/${_i%.m}.1 
  done || return 1
}
