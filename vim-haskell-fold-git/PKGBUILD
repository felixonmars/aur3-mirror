# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-haskell-fold-git
pkgver=20140517
pkgrel=1
pkgdesc="Folded lines are transformed to display the type signature (if any) of the function, providing a great overview of your file content"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/Twinside/vim-haskellFold"
license=('custom:vim')
source=(${pkgname%-git}::git+https://github.com/Twinside/vim-haskellFold)
sha256sums=('SKIP')
provides=('vim-haskell-fold')
conflicts=('vim-haskell-fold')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing documentation...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/vim-haskell-fold/README.md"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in plugin; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
