# Contributor: Oliver Charles <oliver.g.charles@googlemail.com>
pkgname=emacs-cite
pkgver=1.33
pkgrel=1
pkgdesc="A basic message citing engine"
arch=('i686' 'x86_64')
url="http://www.emacswiki.org/emacs/cite.el"
license=('GPL')
depends=('emacs')
source=(http://www.emacswiki.org/cgi-bin/wiki/download/cite.el)

build() {
    cd $srcdir/
    install -Dm644 $srcdir/cite.el $pkgdir/usr/share/emacs/site-lisp/cite.el
}

md5sums=('1c681ba904203329d25924bb68384aa1')
