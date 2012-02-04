# Maintainer: Nathan Owe <nathan.aur at gmail dot com>
pkgname=emacs-rtf
pkgver=1.1
pkgrel=1
pkgdesc="Emacs mode for viewing/editing RTF files"
arch=('any')
url="http://interglacial.com/rtf/"
license=('GPL')
depends=('emacs')
source=("http://interglacial.com/rtf/emacs/rtf-mode.el"
	"LICENSE::http://s3.amazonaws.com/zumodrive/License.rtf")
md5sums=('453a1004954c46fbce2ceb2e1b7389d1'
         '8ef438e34dadc89d3687b3b2f3f10b77')

package() {
  cd "$srcdir/"
  install -d "$pkgdir/usr/share/{licenses/$pkgname,emacs/site-lisp/$pkgname}"
  install -Dm644 rtf-mode.el \
  	  "$pkgdir/usr/share/emacs/site-lisp/$pkgname/rtf-mode.el"
  install -Dm644 LICENSE \
  	  "pkgdir/usr/share/licenses/$pkgname/LICENSE"
	  
}

# vim:set ts=2 sw=2 et:
