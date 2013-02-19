# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>
pkgname=emacs-ruby-electric
pkgver=2.0.0_rc2
pkgrel=1
pkgdesc="Emacs ruby style plugin"
arch=('any')
url="http://ruby-lang.org"
license=('GPL3')
depends=('emacs')
source=("http://svn.ruby-lang.org/repos/ruby/tags/v2_0_0_rc2/misc/ruby-electric.el")
md5sums=('ece4f6e7b57a17d85d0d7adba9eac732')

package() {
  cd "$srcdir/"
  install -d $pkgdir/usr/share/emacs/site-lisp/ruby-electric
  install -Dm644 ruby-electric.el \
  $pkgdir/usr/share/emacs/site-lisp/ruby-style/ruby-electric.el
}
