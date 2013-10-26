# Maintainer: Edgar Kalkowski <eMail@edgar-kalkowski.de>
pkgname=emacs-tree-mode
pkgver=1.3
pkgrel=1
epoch=
pkgdesc="A mode for Emacs to manage tree widgets in the buffer."
arch=('x86_64')
url="http://www.emacswiki.org/emacs/TreeMode"
license=('GPL')
groups=()
depends=(emacs)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=install.sh
changelog=
source=(http://www.newsmth.net/att.php?s.573.50692.4283.zip)
noextract=()

package() {
  cd "$srcdir/tree"
  install -d -m755 "$pkgdir"/usr/share/emacs/site-lisp/
  install -m644 imenu-tree.el tags-tree.el tree-mode.el "$pkgdir"/usr/share/emacs/site-lisp/
  install -m755 myetags "$pkgdir"/usr/share/emacs/site-lisp/
  install -d -m755 "$pkgdir"/usr/share/emacs/site-lisp/tree-widget/imenu/

  for file in bucket.xpm close.png close.xpm empty.png empty.xpm end-guide.png \
              end-guide.xpm function.xpm guide.png guide.xpm handle.png \
              handle.xpm leaf.png leaf.xpm no-guide.png no-guide.xpm \
              no-handle.png no-handle.xpm open.png open.xpm other.xpm \
              variable.xpm; do
    install -m644 tree-widget/imenu/$file "$pkgdir"/usr/share/emacs/site-lisp/tree-widget/imenu/
  done
}
md5sums=('c59ee85d37bfb52511f627ef3c800a38')
