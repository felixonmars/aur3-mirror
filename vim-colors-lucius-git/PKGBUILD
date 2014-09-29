# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-colors-lucius-git
pkgver=20140707
pkgrel=1
pkgdesc="Light and dark color scheme for GUI and 256 color terminal Vim, with several options to customize to your own tastes"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/jonathanfilip/vim-lucius"
license=('custom:vim')
source=(${pkgname%-git}::git+https://github.com/jonathanfilip/vim-lucius)
sha256sums=('SKIP')
provides=('vim-colors-lucius')
conflicts=('vim-colors-lucius')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing docs...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/vim-colors-lucius/README.md"

  msg 'Installing dirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _dir in colors; do
    cp -dpr --no-preserve=ownership $_dir "$pkgdir/usr/share/vim/vimfiles/$_dir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
