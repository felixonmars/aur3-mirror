# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-colors-seoul256-git
pkgver=20140804
pkgrel=1
pkgdesc="a low-contrast Vim color scheme based on Seoul Colors, by Junegunn Choi"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/junegunn/seoul256.vim"
license=('MIT')
source=(${pkgname%-git}::git+https://github.com/junegunn/seoul256.vim)
sha256sums=('SKIP')
provides=('vim-colors-seoul256' 'vim-seoul256')
conflicts=('vim-colors-seoul256' 'vim-seoul256')
install=seoul256.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing docs...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/vim-colors-seoul256/README.md"

  msg 'Installing dirs...'
  install -dm 755 $pkgdir/usr/share/vim/vimfiles
  for _dir in colors; do
    cp -dpr --no-preserve=ownership $_dir $pkgdir/usr/share/vim/vimfiles/$_dir
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
