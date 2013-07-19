# Maintainer: Tianjiao Yin <ytj000+aur@gmail.com>

pkgname=vim-nerdcommenter-git
pkgver=2.2.2_138_g0b3d928
pkgrel=1
arch=('any')
pkgdesc='A plugin that allows for easy commenting of code for many filetypes'
url="http://www.vim.org/scripts/script.php?script_id=1218"
license=('custom')
groups=('vim-plugins')
depends=('vim-runtime')
makedepends=('git')
provides=('vim-nerdcommenter')
conflicts=('vim-nerdcommenter')
install=vimdoc.install
source=(git://github.com/scrooloose/nerdcommenter.git)
sha1sums=(SKIP)

pkgver() {
  cd nerdcommenter
  echo $(git describe --tags | sed 's#-#_#g;s#v##')
}

package() {
  cd "$srcdir/nerdcommenter"
  install -Dm644 plugin/NERD_commenter.vim \
    "$pkgdir/usr/share/vim/vimfiles/plugin/NERD_commenter.vim"
  install -Dm644 doc/NERD_commenter.txt \
    "$pkgdir/usr/share/vim/vimfiles/doc/NERD_commenter.txt"
}

# vim:set ts=2 sw=2 et: 
