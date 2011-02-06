# $Id$
# Contributor: Peter Feigl <peter.feigl@gmail.com>

pkgname=nethack-el
pkgver=0.9.5
pkgrel=1
pkgdesc="Nethack mode for Emacs"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/nethack-el/"
license=(custom)
depends=('nethack-lisp')
source=(http://mirror.lihnidos.org/GNU/savannah/nethack-el/nethack_el-0.9.5.tar.gz)

build() {
  mkdir -p $startdir/pkg/usr/share/emacs/site-lisp
  cp -r $startdir/src/nethack_el-0.9.5 $startdir/pkg/usr/share/emacs/site-lisp
}
source /etc/makepkg.conf
md5sums=('e8e08e1eeb5506871fe7d84e5d0a52b0')
