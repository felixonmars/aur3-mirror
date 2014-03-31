# Maintainer: Bernhard Redl <bernhard.redl@vishap.at>
_author=puppetlabs
pkgname=puppet-syntax-emacs
#$_perlmod
pkgver=1
pkgrel=1
pkgdesc='emacs major mode for puppet syntax highlighting'
arch=('any')
url="https://github.com/puppetlabs/puppet-syntax-emacs/"
license=('Apache')
depends=('emacs')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('!emptydirs')
install=
source=(https://github.com/puppetlabs/puppet-syntax-emacs/archive/master.zip)
sha256sums=('fc6f090af61bcaa33772af36c2f62807a68093fe7276530c4029760dd4d9d1be')

build() {
  cd "$srcdir/"

}

package() {
  cd "$srcdir/$pkgname-master"

  install -dm755 "$pkgdir/usr/share/emacs/24.3/site-lisp/"
  install -D -m644 puppet-mode-init.el "$pkgdir/usr/share/emacs/24.3/site-lisp/"
  install -D -m644 puppet-mode.el "$pkgdir/usr/share/emacs/24.3/site-lisp/"
  install -D -m644 LICENSE "$pkgdir/usr/share/emacs/24.3/site-lisp/puppet-mode.license"

}

# vim:set ts=2 sw=2 et:

