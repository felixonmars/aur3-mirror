# Contributor: Hauke Wesselmann <hauke@h-dawg.de>
pkgname=emacs-snippet-template-mode
pkgver=0.2
pkgrel=3
pkgdesc="Emacs template mode styled after TextMate snippets"
arch=('any')
url="http://www.kazmier.com"
license=('GPL2')
depends=('emacs')
source=('http://www.kazmier.com/computer/snippet.el')
md5sums=('b988e432fd56ffc6795ebc3c35b6fbac')

build() {
cd $startdir/src/
install -Dm644 $startdir/src/snippet.el $startdir/pkg/usr/share/emacs/site-lisp/snippet.el
} 
