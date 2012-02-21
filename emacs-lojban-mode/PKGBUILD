# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=emacs-lojban-mode
pkgver=0.7
pkgrel=1
pkgdesc="A minor mode for text in Lojban, providing syntax highlighting"
arch=('any')
url="http://www.emacswiki.org/cgi-bin/wiki?LojbanMode"
license=('GPL')
depends=('emacs')
install=emacs-lojban-mode.install
source=("http://www.emacswiki.org/emacs/download/lojban-mode.el"
  "http://www.emacswiki.org/emacs/download/lojban.el")

package() {
  cd "$srcdir"
  install -d "${pkgdir}/usr/share/emacs/site-lisp"
  install -D -m644 lojban.el lojban-mode.el "${pkgdir}/usr/share/emacs/site-lisp"
}

# vim:set ts=2 sw=2 et:
md5sums=('d89afac14cb3dae3314d2164e9a9a244'
         'ec3d4485590c260a143a3a36313a49c3')
