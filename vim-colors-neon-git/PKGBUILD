# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-colors-neon-git
pkgver=20140214
pkgrel=1
pkgdesc="Neon color scheme for Vim"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/yuratomo/neon.vim"
license=('MIT')
source=(${pkgname%-git}::git+https://github.com/yuratomo/neon.vim)
sha256sums=('SKIP')
provides=('vim-colors-neon' 'vim-neon')
conflicts=('vim-colors-neon' 'vim-neon')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing docs...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/vim-colors-neon/README.md"

  msg 'Installing dirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _dir in colors; do
    cp -dpr --no-preserve=ownership $_dir "$pkgdir/usr/share/vim/vimfiles/$_dir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
