# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-armasm-git
pkgver=20140113
pkgrel=1
pkgdesc="Syntax highlighting for ARM assembler"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/alisdair/vim-armasm"
license=('MIT')
source=(${pkgname%-git}::git+https://github.com/alisdair/vim-armasm)
sha256sums=('SKIP')
provides=('vim-armasm')
conflicts=('vim-armasm')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing documentation...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/vim-armasm/README.md"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in ftdetect syntax; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
