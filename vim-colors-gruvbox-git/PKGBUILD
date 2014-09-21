# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-colors-gruvbox-git
pkgver=20140906
pkgrel=1
pkgdesc="Retro groove color scheme heavily inspired by badwolf, jellybeans and solarized"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/morhetz/gruvbox"
license=('MIT')
source=(${pkgname%-git}::git+https://github.com/morhetz/gruvbox)
sha256sums=('SKIP')
provides=('vim-colors-gruvbox')
conflicts=('vim-colors-gruvbox')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing docs...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/vim-colors-gruvbox/README.md"

  msg 'Installing dirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _dir in autoload colors; do
    cp -dpr --no-preserve=ownership $_dir "$pkgdir/usr/share/vim/vimfiles/$_dir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
