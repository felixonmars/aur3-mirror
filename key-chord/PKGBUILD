# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Damien Thiriet <damien&#46;thiriet77&#64;laposte&#46;net>
pkgname=key-chord
pkgver=0.5
pkgrel=1.2
pkgdesc="Emacs mode to map pairs of simultaneously pressed keys to commands"
arch=('any')
url="http://www.emacswiki.org/emacs/key-chord.el"
license=('GPL')
depends=('emacs')
install='key-chord.install'
source=("http://www.emacswiki.org/emacs/download/key-chord.el")
md5sums=('9f9dc5dbc28bae73b09c5675779c096e')

package() {
  cd "$srcdir/"
  install -Dm644 $pkgname.el \
    $pkgdir/usr/share/emacs/site-lisp/$pkgname.el
}

# vim:set ts=2 sw=2 et:
