# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-hasksyn-git
pkgver=20140723
pkgrel=1
pkgdesc="A vim mode for Haskell that provides more comprehensive syntax highlighting for normal Haskell code, along with fairly reasonable indentation, and improved highlighting for cabal files"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/travitch/hasksyn"
license=('BSD')
source=(${pkgname%-git}::git+https://github.com/travitch/hasksyn)
sha256sums=('SKIP')
provides=('vim-hasksyn')
conflicts=('vim-hasksyn')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing documentation...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/vim-hasksyn/README.md"
  cp -dpr --no-preserve=ownership demos "$pkgdir/usr/share/doc/vim-hasksyn"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in after indent syntax; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
