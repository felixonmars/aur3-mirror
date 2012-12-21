# Maintainer: Gabriel Peixoto <gabrielrcp@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-template  
pkgver=3.1c
pkgrel=1 
pkgdesc="Supplies an initial emacs buffer content via a template"
url="http://emacs-template.sourceforge.net/"
arch=('any')
license=('GPL2')
depends=('emacs')
source=(http://downloads.sourceforge.net/project/$pkgname/template/$pkgver/template-$pkgver.tar.gz)
md5sums=('c17c8346535f3056f2005a0eaf2d16f5')
install=emacs-template.install

build() {
  cd "${srcdir}/template/lisp"
  emacs -batch -q -f batch-byte-compile template.el
}

package() {
  cd "$srcdir/template/lisp"
  install -d "${pkgdir}/usr/share/emacs/site-lisp"
  install -m644 template.el{,c} "${pkgdir}/usr/share/emacs/site-lisp"
  install -d "${pkgdir}/usr/share/doc/emacs-template" 
  install -m644 "${srcdir}"/template/templates/* \
    "$pkgdir/usr/share/doc/emacs-template"
}
