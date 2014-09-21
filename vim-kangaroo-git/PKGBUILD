# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-kangaroo-git
pkgver=20140912
pkgrel=1
pkgdesc="Maintain a simple, manually-defined jump stack"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/tommcdo/vim-kangaroo"
license=('custom:vim')
source=(${pkgname%-git}::git+https://github.com/tommcdo/vim-kangaroo)
sha256sums=('SKIP')
provides=('vim-kangaroo')
conflicts=('vim-kangaroo')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing documentation...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/vim-kangaroo/README.md"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in doc plugin; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
