# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-neco-ghc-git
pkgver=20140819
pkgrel=1
pkgdesc="A completion plugin for Haskell, using ghc-mod"
arch=('any')
depends=('haskell-ghc-mod' 'vim' 'vim-vimproc')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/eagletmt/neco-ghc"
license=('MIT')
source=(${pkgname%-git}::git+https://github.com/eagletmt/neco-ghc)
sha256sums=('SKIP')
provides=('vim-neco-ghc')
conflicts=('vim-neco-ghc')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing documentation...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/vim-neco-ghc/README.md"
  install -Dm 644 CONTRIBUTING.md "$pkgdir/usr/share/doc/vim-neco-ghc/CONTRIBUTING.md"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in autoload plugin; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
