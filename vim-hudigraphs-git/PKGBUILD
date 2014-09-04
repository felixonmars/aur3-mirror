# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-hudigraphs-git
pkgver=20131218
pkgrel=1
pkgdesc="Vim global plugin for heads-up digraph interactions, by Damien Conway"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/atweiden/vim-hudigraphs"
license=('custom:vim')
source=(git+https://github.com/atweiden/vim-hudigraphs)
sha256sums=('SKIP')
provides=('vim-hudigraphs')
conflicts=('vim-hudigraphs')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing docs...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/vim-hudigraphs/README.md"

  msg 'Installing dirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _dir in plugin; do
    cp -dpr --no-preserve=ownership $_dir "$pkgdir/usr/share/vim/vimfiles/$_dir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
