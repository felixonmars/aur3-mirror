# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-haskell-conceal-plus-git
pkgver=20140823
pkgrel=1
pkgdesc="Displays unicode operators in Haskell code so you can enjoy proper notation without cumbersome unicode-input methods and without changing the underlying file"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/enomsg/vim-haskellConcealPlus"
license=('MIT')
source=(${pkgname%-git}::git+https://github.com/enomsg/vim-haskellConcealPlus)
sha256sums=('SKIP')
provides=('vim-haskell-conceal-plus')
conflicts=('vim-haskell-conceal-plus')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing documentation...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/vim-haskell-conceal-plus/README.md"
  install -Dm 644 demo.hs "$pkgdir/usr/share/doc/vim-haskell-conceal-plus/demo.hs"
  install -Dm 644 demo.png "$pkgdir/usr/share/doc/vim-haskell-conceal-plus/demo.png"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in after; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
