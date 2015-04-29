# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-lengthmatters
pkgver=0.1.2
pkgrel=1
pkgdesc="Highlight the flooding part of an overly long line"
arch=('any')
depends=('vim')
groups=('vim-plugins')
url="https://github.com/whatyouhide/vim-lengthmatters"
license=('WTFPL')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/whatyouhide/$pkgname/tar.gz/$pkgver)
sha256sums=('9e31b28176f9e925b19da1321b532c144f97969f07d62f62bd8f616860146038')
install=vimdoc.install

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg 'Installing documentation...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/vim-lengthmatters/README.md"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in autoload doc plugin; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done
}
