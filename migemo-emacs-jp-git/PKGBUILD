# Maintainer: yuki-san <yuki.from.akita _at_ gmail.com>

pkgname=migemo-emacs-jp-git
pkgver=0.r32.53dc01a
pkgrel=1
pkgdesc="Japanese incremental search with 'Romaji' (cmigemo version provided by emacs-jp)"
arch=('any')
url="https://github.com/emacs-jp/migemo"
license=('GPL')
depends=('emacs' 'cmigemo')
makedepends=('git')
provides=('migemo')
conflicts=('migemo')
options=()
install=migemo-emacs-jp-git.install
source=(${pkgname%-emacs-jp-git}::'git+https://github.com/emacs-jp/migemo.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-emacs-jp-git}"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-emacs-jp-git}"
  sed -i -e 's!@pkgdatadir@!/usr/share/emacs/site-lisp!g' migemo.el
  emacs -q -batch -f batch-byte-compile migemo.el
}

package() {
  cd "$srcdir/${pkgname%-emacs-jp-git}"
  install -d -m 755 "$pkgdir"/usr/share/emacs/site-lisp
  install -c -m 644 migemo.el "$pkgdir"/usr/share/emacs/site-lisp
  install -c -m 644 migemo.elc "$pkgdir"/usr/share/emacs/site-lisp

  install -d -m 755 "$pkgdir"/usr/share/doc/migemo-emacs-jp-git
  install -c -m 644 README.md "$pkgdir"/usr/share/doc/migemo-emacs-jp-git
  install -d -m 755 images "$pkgdir"/usr/share/doc/migemo-emacs-jp-git/images
  install -c -m 644 images/migemo.png "$pkgdir"/usr/share/doc/migemo-emacs-jp-git/images
}

# vim:set ts=2 sw=2 et:
