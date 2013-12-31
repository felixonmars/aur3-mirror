# Maintainer: listx <linusarver <at> gmail <dot> com>
pkgname=emacs-markdown-mode
pkgver=2.0
pkgrel=4
pkgdesc="A major mode for editing Markdown files in Emacs"
arch=('any')
url="http://jblevins.org/projects/markdown-mode"
license=('GPL')
depends=('emacs')
provides=('emacs-markdown-mode')
conflicts=(
	'emacs-markdown-mode'
	'emacs-markdown-mode-git'
)
install=$pkgname.install
source="$url/markdown-mode.el"
sha1sums=('92a01ab731e3fb8baca4c66fae0727936d44d3f3')

build() {
	# compile for speed
	emacs -batch -f batch-byte-compile markdown-mode.el
}

package() {
	# create destination path
	install -d $pkgdir/usr/share/emacs/site-lisp
	# copy over file into path
	cp $srcdir/markdown-mode.{el,elc} $pkgdir/usr/share/emacs/site-lisp
}
