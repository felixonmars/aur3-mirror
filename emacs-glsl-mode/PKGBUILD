# Maintainer: Pierre Neidhardt <ambrevar at gmail dot com>

_name=glsl-mode
pkgname=emacs-$_name
pkgver=1.0
pkgrel=1
pkgdesc="Emacs major mode for GLSL"
arch=('any')
url="http://maverick.inria.fr/~Xavier.Decoret/resources/glsl-mode/index.html"
license=('GPL')
depends=()
makedepends=('emacs')
install=$pkgname.install
source=(http://maverick.inria.fr/~Xavier.Decoret/resources/$_name/$_name.el)
sha1sums=('4445bf19ce35de0d51042cd7aa361afabde0a9ca')

build() {
  emacs --batch --no-site-file -f batch-byte-compile $_name.el
}

package() {
  mkdir -p $pkgdir/usr/share/emacs/site-lisp
  cp *.el{c,} $pkgdir/usr/share/emacs/site-lisp/
}
