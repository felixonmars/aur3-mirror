# Maintainer: Oleg Smirnov <oleg.smirnov@gmail.com>
pkgname=emacs-protobuf-mode
pkgver=0.3
pkgrel=3
pkgdesc="Emacs mode for Google protobuf"
arch=('any')
url="http://protobuf.googlecode.com/"
depends=('emacs')
source=(protobuf-mode.el)
md5sums=('53e72132d5e71189137d6bd19d680178')
license=('custom')
install=${pkgname}.install
build() {
	cd ${srcdir}
	emacs -batch -f batch-byte-compile protobuf-mode.el || return 1
	install -D -m644 "$srcdir/protobuf-mode.el" \
   		"$pkgdir/usr/share/emacs/site-lisp/protobuf-mode.el"
	install -D -m644 "$srcdir/protobuf-mode.elc" \
   		"$pkgdir/usr/share/emacs/site-lisp/protobuf-mode.elc"
}
