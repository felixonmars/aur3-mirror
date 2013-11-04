pkgname=vim-junos-git
pkgver=18.6a65ebc
pkgrel=1
pkgdesc="Vim syntax highlighting for Junos configuration files"
arch=("any")
url="https://github.com/ClockworkNet/vim-junos-syntax"
license=("MIT")
depends=("vim")
makedepends=("git")
options=("emptydirs")
source=("vim-junos::git://github.com/ClockworkNet/vim-junos-syntax.git")
md5sums=("SKIP")
pkgver() {
  cd "${srcdir}/vim-junos"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}
package() {
  install -Dm644 "$srcdir/vim-junos/syntax/junos.vim"   "$pkgdir/usr/share/vim/vimfiles/syntax/junos.vim"
  install -Dm644 "$srcdir/vim-junos/ftdetect/junos.vim" "$pkgdir/usr/share/vim/vimfiles/ftdetect/junos.vim"
} 
