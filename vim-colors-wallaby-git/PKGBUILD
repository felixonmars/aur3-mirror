# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-colors-wallaby-git
pkgver=20131118
pkgrel=1
pkgdesc="Modernized wombat256 color scheme with increased contrast"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/rhysd/wallaby.vim"
license=('custom:vim')
source=(${pkgname%-git}::git+https://github.com/rhysd/wallaby.vim)
sha256sums=('SKIP')
provides=('vim-colors-wallaby' 'vim-wallaby')
conflicts=('vim-colors-wallaby' 'vim-wallaby')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing docs...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/vim-colors-wallaby/README.md"

  msg 'Installing dirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _dir in colors; do
    cp -dpr --no-preserve=ownership $_dir "$pkgdir/usr/share/vim/vimfiles/$_dir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
