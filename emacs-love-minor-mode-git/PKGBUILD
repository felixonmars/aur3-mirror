pkgname=emacs-love-minor-mode-git
_gitname=love-minor-mode
pkgver=v1.1.5.g8a6906b
pkgrel=1
pkgdesc="Emacs minor mode for love2d"
arch=('any')
url="https://github.com/ejmr/love-minor-mode"
license=('GPL3')
depends=('emacs' 'emacs-lua-mode')
makedepends=('git')
conflicts=('emacs-love-minor-mode')
provides=('emacs-love-minor-mode')
install=emacs-love-minor-mode-git.install
source=('git://github.com/ejmr/love-minor-mode.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g'
}

build() {
  cd $_gitname
  emacs -batch -f batch-byte-compile love-minor-mode.el
}

package() {
  cd $_gitname
  install -d $pkgdir/usr/share/emacs/site-lisp
  install -m644 *.el* $pkgdir/usr/share/emacs/site-lisp/
}
