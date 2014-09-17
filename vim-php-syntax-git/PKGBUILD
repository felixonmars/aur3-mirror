# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-php-syntax-git
pkgver=20140802
pkgrel=1
pkgdesc="Updated version of the official Vim syntax script for PHP which fixes a few issues and adds support for some of the newest PHP features"
arch=('any')
depends=('vim')
makedepends=('git')
optdepends=('vim-php-indent-git: updated version of the official Vim indent script for PHP')
groups=('vim-plugins')
url="https://github.com/2072/vim-syntax-for-PHP"
license=('custom:vim')
source=(${pkgname%-git}::git+https://github.com/2072/vim-syntax-for-PHP)
sha256sums=('SKIP')
provides=('vim-php-syntax')
conflicts=('vim-php-syntax')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing documentation...'
  install -Dm 644 readme.md "$pkgdir/usr/share/doc/vim-php-syntax/readme.md"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in syntax; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
