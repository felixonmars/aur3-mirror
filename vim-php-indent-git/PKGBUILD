# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-php-indent-git
pkgver=20140907
pkgrel=1
pkgdesc="Updated version of the official Vim indent script for PHP"
arch=('any')
depends=('vim')
makedepends=('git')
optdepends=('vim-php-syntax-git: updated version of the official Vim syntax script for PHP')
groups=('vim-plugins')
url="https://github.com/2072/PHP-Indenting-for-VIm"
license=('custom:vim')
source=(${pkgname%-git}::git+https://github.com/2072/PHP-Indenting-for-VIm)
sha256sums=('SKIP')
provides=('vim-php-indent')
conflicts=('vim-php-indent')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing documentation...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/vim-php-indent/README.md"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in doc indent; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
