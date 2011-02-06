# Maintainer: Serge Ziryukin <ftrvxmtrx@gmail.com>

pkgname=emacs-manual-html
pkgver=20101011
pkgrel=1
pkgdesc="GNU Emacs manual in HTML format, with one page per node"
arch=('any')
url="http://www.gnu.org/software/emacs/manual/emacs.html"
license=('FDL')
source=(http://www.gnu.org/software/emacs/manual/emacs.html_node.tar.gz)
md5sums=('af26ab66d1de0c61227cdaa66edfaa58')

package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/share/doc/emacs.html"
  install -m644 emacs.html/* -t "$pkgdir/usr/share/doc/emacs.html"
}
