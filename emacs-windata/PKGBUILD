# Maintainer: Edgar Kalkowski <eMail@edgar-kalkowski.de>
pkgname=emacs-windata
pkgver=0.0
pkgrel=1
epoch=
pkgdesc="Convert emacs window configuration to list."
arch=('x86_64')
url="http://www.emacswiki.org/emacs/windata.el"
license=('GPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://www.emacswiki.org/emacs/download/windata.el)
noextract=()

package() {
  cd "$srcdir"
  install -d -m755 "$pkgdir"/usr/share/emacs/site-lisp/
  install -m644 windata.el "$pkgdir"/usr/share/emacs/site-lisp/
}
md5sums=('ae945a7a1aeb1e2989ccac447314b834')
