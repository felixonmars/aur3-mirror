# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-colors-bubblegum-git
pkgver=20140916
pkgrel=1
pkgdesc="A vim color scheme based on xoria256"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/baskerville/bubblegum"
license=('custom:vim')
source=(${pkgname%-git}::git+https://github.com/baskerville/bubblegum)
sha256sums=('SKIP')
provides=('vim-colors-bubblegum')
conflicts=('vim-colors-bubblegum')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing docs...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/vim-colors-bubblegum/README.md"
  cp -dpr --no-preserve=ownership preview "$pkgdir/usr/share/doc/vim-colors-bubblegum"

  msg 'Installing dirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _dir in colors; do
    cp -dpr --no-preserve=ownership $_dir "$pkgdir/usr/share/vim/vimfiles/$_dir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
