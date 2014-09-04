# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-expand-region-git
pkgver=20130819
pkgrel=1
pkgdesc="Visually select increasingly larger regions of text using the same key combination"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/terryma/vim-expand-region"
license=('MIT')
source=(git+https://github.com/terryma/vim-expand-region)
sha256sums=('SKIP')
provides=('vim-expand-region')
conflicts=('vim-expand-region')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing license...'
  install -Dm 644 MIT-LICENSE.txt "$pkgdir/usr/share/licenses/vim-expand-region/MIT-LICENSE.txt"

  msg 'Installing docs...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/vim-expand-region/README.md"
  install -Dm 644 expand-region.gif "$pkgdir/usr/share/doc/vim-expand-region/expand-region.gif"

  msg 'Installing dirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _dir in autoload doc plugin; do
    cp -dpr --no-preserve=ownership $_dir "$pkgdir/usr/share/vim/vimfiles/$_dir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
