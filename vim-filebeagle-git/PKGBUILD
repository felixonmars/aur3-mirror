# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-filebeagle-git
pkgver=20140806
pkgrel=1
pkgdesc="A VINE-spired (Vim Is Not Emacs) file system explorer"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/jeetsukumaran/vim-filebeagle"
license=('MIT')
source=(git+https://github.com/jeetsukumaran/vim-filebeagle)
sha256sums=('SKIP')
provides=('vim-filebeagle')
conflicts=('vim-filebeagle')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing documentation...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/vim-filebeagle/README.md"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in autoload doc plugin; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
