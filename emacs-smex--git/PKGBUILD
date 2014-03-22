#Maintained by ivoarch <ivkuzev@gmail.com>
pkgname=emacs-smex--git
pkgver=ab59af5
pkgrel=2
pkgdesc="ido-like completion on M-x"
url="https://github.com/nonsequitur/smex.git"
arch=('any')
license=('GPL')
depends=('emacs')
makedepends=('git')
install=smex.install
source=("git+https://github.com/nonsequitur/smex.git")
md5sums=('SKIP')

gitname="smex"

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
  install -d ${pkgdir}/usr/share/emacs/site-lisp/${gitname}
  cp *.el *.elc ${pkgdir}/usr/share/emacs/site-lisp/${gitname}
}
