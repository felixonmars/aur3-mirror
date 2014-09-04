# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-delimitmate-git
pkgver=20140219
pkgrel=1
pkgdesc="Provides automatic closing of quotes, parenthesis, brackets, etc"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/Raimondi/delimitMate"
license=('custom:vim')
source=(${pkgname%-git}::git+https://github.com/Raimondi/delimitMate)
sha256sums=('SKIP')
provides=('vim-delimitmate')
conflicts=('vim-delimitmate')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing documentation...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/vim-delimitmate/README.md"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in autoload doc plugin; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
