# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-php-git
pkgver=20110124
pkgrel=1
pkgdesc="Vim PHP language features"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/madflow/vim-php"
license=('MIT')
source=(git+https://github.com/madflow/vim-php)
sha256sums=('SKIP')
provides=('vim-php')
conflicts=('vim-php')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing documentation...'
  install -Dm 644 README.rst "$pkgdir/usr/share/doc/vim-php/README.rst"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in ftplugin indent syntax; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
