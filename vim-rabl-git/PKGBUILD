# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-rabl-git
pkgver=20120815
pkgrel=1
pkgdesc="Treat RABL files as Ruby files, with a little extra sugar for RABL-specific DSL methods"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/yaymukund/vim-rabl"
license=('MIT')
source=(git+https://github.com/yaymukund/vim-rabl)
sha256sums=('SKIP')
provides=('vim-rabl')
conflicts=('vim-rabl')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing documentation...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/vim-rabl/README.md"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in after ftdetect; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
