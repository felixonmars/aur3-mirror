# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-elixir-git
pkgver=20140912
pkgrel=1
pkgdesc="Vim configuration files for Elixir"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/elixir-lang/vim-elixir"
license=('custom:vim')
source=(git+https://github.com/elixir-lang/vim-elixir)
sha256sums=('SKIP')
provides=('vim-elixir')
conflicts=('vim-elixir')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing docs...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/vim-elixir/README.md"

  msg 'Installing dirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _dir in compiler ftdetect ftplugin indent syntax; do
    cp -dpr --no-preserve=ownership $_dir "$pkgdir/usr/share/vim/vimfiles/$_dir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
