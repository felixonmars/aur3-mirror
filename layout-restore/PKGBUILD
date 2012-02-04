# Contributor: stuck_pxl <flam44@gmail.com>
pkgname=layout-restore
pkgver=0.4
pkgrel=1 
pkgdesc="keep window configuration as layout and restore it"
url="http://www.emacswiki.org/cgi-bin/wiki/LayoutRestore"
arch=('any')
license=('GPL2')
depends=()
install=$pkgname.install
source=(http://www.emacswiki.org/emacs/download/$pkgname.el)
md5sums=('a8436975b6a0b66145b0a2e0b9ed416b')

build() {
  mkdir -p $startdir/pkg/usr/share/emacs/site-lisp
  cp $startdir/src/$pkgname.el $startdir/pkg/usr/share/emacs/site-lisp
}
