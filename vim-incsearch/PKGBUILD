# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-incsearch
pkgver=1.0.2
pkgrel=1
pkgdesc="Incrementally highlights all pattern matches unlike default incsearch"
arch=('any')
depends=('vim' 'vim-vital-git')
groups=('vim-plugins')
url="https://github.com/haya14busa/incsearch.vim"
license=('MIT')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/haya14busa/incsearch.vim/tar.gz/v$pkgver)
sha256sums=('c3ad92368628deea598f1ab670b2abc5ef084c585af68f6989eb71bc639184db')
install=vimdoc.install

package() {
  cd "$srcdir/${pkgname##vim-}.vim-$pkgver"

  msg 'Installing documentation...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/vim-incsearch/README.md"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in autoload doc plugin; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Removing vital.vim (provided by vim-vital-git)'
  rm -f "$pkgdir/usr/share/vim/vimfiles/autoload/vital.vim"

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
