# Contributor: Ondrej Kucera <ondrej.kucera@centrum.cz>

pkgname=emacs-dos-mode  
pkgver=2.17
pkgrel=1 
pkgdesc="Major mode for editing Dos scripts (batch files)"
url="http://www.emacswiki.org/emacs/DosMode"
arch=('any')
license=('')
depends=(emacs)
makedepends=(emacs)
source=(http://www.emacswiki.org/emacs/download/dos.el)
md5sums=('29c5031c89e0962f6d8d3f47661ff141')

build() {
  cd $startdir/src
  emacs -batch -q -f batch-byte-compile dos.el
  install -Dm644 $srcdir/dos.el $pkgdir/usr/share/emacs/site-lisp/dos.el
  install -Dm644 $srcdir/dos.elc $pkgdir/usr/share/emacs/site-lisp/dos.elc
}
