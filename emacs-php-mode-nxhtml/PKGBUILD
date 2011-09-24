# Maintainer: XeCycle <XeCycle@Gmail.com>
# Created Sat, 24 Sep 2011 14:02:09 +0800

pkgname=emacs-php-mode-nxhtml
pkgver=1.94
pkgrel=1
_nxhtmlver=2.08-100425
pkgdesc="A major mode for editing PHP files in Emacs, bug fixes by nxhtml project."
arch=('any')
url="http://ourcomments.org/Emacs/nXhtml/doc/nxhtml.html"
license=('GPL')
groups=()
depends=('emacs')
makedepends=('emacs')
optdepends=()
provides=('emacs-php-mode')
conflicts=('emacs-php-mode')
replaces=('emacs-php-mode')
install=$pkgname.install
source=("http://ourcomments.org/Emacs/DL/elisp/nxhtml/zip/nxhtml-$_nxhtmlver.zip")
md5sums=('26bfe125c38801246aeb64df00541efa')

build() {
  cd "$srcdir/nxhtml/related"
  emacs --batch --no-site-file -f batch-byte-compile php-mode.el
}

package() {
  cd "$srcdir/nxhtml/related"
  install -d $pkgdir/usr/share/emacs/site-lisp
  install -m 644 php-mode.el php-mode.elc $pkgdir/usr/share/emacs/site-lisp
}
