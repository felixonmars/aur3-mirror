# Maintainer: Oleg Smirnov <oleg.smirnov@gmail.com>
pkgname=emacs-coffeescript-mode
pkgver=0.4.0
pkgrel=1
pkgdesc="CoffeeScript mode for Emacs"
arch=("any")
url="http://ozmm.org/posts/coffee_mode.html"
depends=("emacs")
license=("custom")
source=("https://raw.github.com/defunkt/coffee-mode/v$pkgver/coffee-mode.el")
md5sums=('7d7abb5b1a153c23cde7d2fa8fa31acf')
install=${pkgname}.install
build() {
  mkdir -p "${pkgdir}/usr/share/emacs/site-lisp/"
  cd ${srcdir}
  install -D -m644 "${srcdir}/coffee-mode.el" "${pkgdir}/usr/share/emacs/site-lisp/coffee-mode.el"
}
