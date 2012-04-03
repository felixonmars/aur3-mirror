# Maintainer: Hsiaofeng Liu <hsfngliu.lisp@gmail.com>

pkgname=emacs-slime
pkgver=current
pkgrel=1
pkgdesc="The Superior Lisp Interaction Mode for Emacs"
arch=('any')
url="http://common-lisp.net/project/slime/"
license=('unknown')
depends=('emacs')
makedepends=('emacs')
source=('http://common-lisp.net/project/slime/snapshots/slime-current.tgz')
md5sums=('a6869dcf8fa2db5abeb5aa4fee3ab7ac')

package(){
	cd $srcdir
	mkdir -p $pkgdir/opt/slime
	cp -ru slime-20*/* $pkgdir/opt/slime
}
