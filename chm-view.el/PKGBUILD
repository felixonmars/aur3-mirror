# Maintainer: Marko Vojvodic <markovojvodic84@gmail.com>
pkgname=chm-view.el
pkgver=0.2.2
pkgrel=1
pkgdesc="emacs mode for viewing chm files"
arch=('i686' 'x86_64')
url="http://www.emacswiki.org/"
license=('GPL3')
depends=('emacs')
source=(http://www.emacswiki.org/emacs/download/chm-view.el)
md5sums=('d0ef62b7c438d93f6d3fbed4a9845268')

build() {
   cd $startdir/
   install -Dm644 $startdir/chm-view.el $startdir/pkg/usr/share/emacs/site-lisp/chm-view.el
}
