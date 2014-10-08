# Maintainer: Gently <toddrpartridge@gmail.com>

pkgname=gently-vim-git
_pkgname=${pkgname%-*}
pkgver=0.86.6
pkgrel=1
pkgdesc="A Vim configuration file meant to replace the local ~/.vimrc."
arch=("any")
url="https://github.com/Gen2ly/$_pkgname"
license=("GPL2")
depends=("vim" "vim-jellybeans")
makedepends=("git")
install=${_pkgname}.install
source=("git://github.com/Gen2ly/$_pkgname")
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  git describe --long | sed -r 's/-([0-9,a-g,A-G]{7}.*)//' | sed 's/-/./'
}

package() {
  cd $srcdir/$_pkgname
  install -Dm755 ${_pkgname/-/.} $pkgdir/usr/share/vim/vimfiles/${_pkgname/-/.}
  install -Dm644 license.txt     $pkgdir/usr/share/licenses/$_pkgname/license.txt
}

# vim:set ts=2 sw=2 et:
