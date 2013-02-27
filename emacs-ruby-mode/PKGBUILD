# Maintainer: Philip Müller <mail at philip.in-aachen dot net>
pkgname=emacs-ruby-mode
pkgver=2.0.0_p0
pkgrel=1
pkgdesc="Emacs ruby mode plugin"
arch=('any')
url="http://ruby-lang.org"
license=('GPL3')
depends=('emacs')
#tagname=$(echo "v$pkgver" | sed 's/\./_/g')
tagname=v2_0_0_0
source=("http://svn.ruby-lang.org/repos/ruby/tags/${tagname}/misc/ruby-mode.el" "http://svn.ruby-lang.org/repos/ruby/tags/$tagname/misc/inf-ruby.el"  "http://svn.ruby-lang.org/repos/ruby/tags/$tagname/misc/ruby-electric.el")
md5sums=('7430eac3aa3b3bc26bdb3837106ebd81'
         'ca74dfbbedb3b82d1c0aad15be3460b0'
         'ece4f6e7b57a17d85d0d7adba9eac732')

package() {
  cd "$srcdir/"
  install -d $pkgdir/usr/share/emacs/site-lisp/ruby-mode
  install -Dm644 ruby-mode.el $pkgdir/usr/share/emacs/site-lisp/ruby-mode/ruby-mode.el
  install -Dm644 inf-ruby.el $pkgdir/usr/share/emacs/site-lisp/ruby-mode/inf-ruby.el
  install -Dm644 ruby-electric.el $pkgdir/usr/share/emacs/site-lisp/ruby-mode/ruby-electric.el
}
