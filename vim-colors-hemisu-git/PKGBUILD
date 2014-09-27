# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-colors-hemisu-git
pkgver=20130905
pkgrel=1
pkgdesc="Color scheme with dark and light variants"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/noahfrederick/vim-hemisu"
license=('CCPL')
source=(${pkgname%-git}::git+https://github.com/noahfrederick/vim-hemisu)
sha256sums=('SKIP')
provides=('vim-colors-hemisu')
conflicts=('vim-colors-hemisu')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing docs...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/vim-colors-hemisu/README.md"

  msg 'Installing dirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _dir in colors; do
    cp -dpr --no-preserve=ownership $_dir "$pkgdir/usr/share/vim/vimfiles/$_dir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
