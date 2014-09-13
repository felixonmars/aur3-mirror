# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-colors-iceberg-git
pkgver=20140609
pkgrel=1
pkgdesc="A dark blue color scheme for Vim. It brings a cool-headed perspective for your happy coding"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/cocopon/iceberg.vim"
license=('MIT')
source=(${pkgname%-git}::git+https://github.com/cocopon/iceberg.vim)
sha256sums=('SKIP')
provides=('vim-colors-iceberg' 'vim-iceberg')
conflicts=('vim-colors-iceberg' 'vim-iceberg')
install=iceberg.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing license...'
  install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/vim-colors-iceberg/LICENSE.txt"

  msg 'Installing docs...'
  install -Dm 644 CHANGES.txt "$pkgdir/usr/share/doc/vim-colors-iceberg/CHANGES.txt"
  install -Dm 644 README.md "$pkgdir/usr/share/doc/vim-colors-iceberg/README.md"

  msg 'Installing dirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _dir in colors; do
    cp -dpr --no-preserve=ownership $_dir "$pkgdir/usr/share/vim/vimfiles/$_dir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
