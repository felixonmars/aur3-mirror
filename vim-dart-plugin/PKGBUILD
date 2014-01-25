# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=vim-dart-plugin
pkgver=20140124
pkgrel=1
pkgdesc='Syntax highlighting for Dart in Vim'
arch=('any')
url='https://github.com/dart-lang/dart-vim-plugin'
license=('BSD')
depends=('vim')
source=("git+https://github.com/dart-lang/dart-vim-plugin.git")
md5sums=('SKIP')

package() {
  cd "$srcdir"/dart-vim-plugin

  installpath="$pkgdir/usr/share/vim/vimfiles"

  install -Dm0644 ftdetect/dart.vim "$installpath/ftdetect/dart.vim"
  install -Dm0644 syntax/dart.vim "$installpath/syntax/dart.vim"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
