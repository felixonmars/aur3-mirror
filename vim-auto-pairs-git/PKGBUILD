# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-auto-pairs-git
pkgver=20131020
pkgrel=1
pkgdesc="Autoclose, insert or delete brackets, parens, quotes in pair"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/jiangmiao/auto-pairs"
license=('MIT')
source=(${pkgname%-git}::git+https://github.com/jiangmiao/auto-pairs)
sha256sums=('SKIP')
provides=('vim-auto-pairs')
conflicts=('vim-auto-pairs')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing documentation...'
  install -Dm 644 README.md $pkgdir/usr/share/doc/vim-auto-pairs/README.md

  msg 'Installing appdirs...'
  install -dm 755 $pkgdir/usr/share/vim/vimfiles
  for _appdir in plugin; do
    cp -dpr --no-preserve=ownership $_appdir $pkgdir/usr/share/vim/vimfiles/$_appdir
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
