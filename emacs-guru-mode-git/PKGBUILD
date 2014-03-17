#Maintained by ivoarch <ivkuzev@gmail.com>
pkgname=emacs-guru-mode-git
pkgver=62a9a00
pkgrel=3
pkgdesc="Guru-mode disables some common keybindings and suggests the use of the established Emacs alternatives instead."
url="https://github.com/bbatsov/guru-mode.git"
arch=('any')
license=('GPL')
depends=('emacs')
makedepends=('git')
install=guru-mode.install
source=("git+https://github.com/bbatsov/guru-mode.git")
md5sums=('SKIP')

gitname="guru-mode"


pkgver() {
  cd $srcdir/$gitname
  git describe --always | sed 's|-|.|g'
}

build() {
  cd $srcdir/$gitname
  #
  # BUILD HERE
  #
  emacs --batch -f batch-byte-compile *.el
}

package() {
  cd "$srcdir/$gitname"
  install -d ${pkgdir}/usr/share/emacs/site-lisp/guru-mode
  cp *.el *.elc ${pkgdir}/usr/share/emacs/site-lisp/guru-mode
}
