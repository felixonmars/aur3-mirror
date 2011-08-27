# Maintainer: Robson Roberto Souza Peixoto <robsonpeixoto@gmail.com>

pkgname=vim-cscope
pkgver=20020307
pkgrel=2
pkgdesc='CSCOPE settings for vim'
arch=('any')
url='http://cscope.sourceforge.net/cscope_vim_tutorial.html'
license=('unknown')
depends=('vim' 'cscope')
source=(http://cscope.sourceforge.net/cscope_maps.vim)
md5sums=('bd4d185d56d42965b920123b0e1ee779')

build() {
  cd "$srcdir"
}

package() {
  local _installpath="$pkgdir/usr/share/vim/vimfiles"
  install -D -m644 "cscope_maps.vim" "${_installpath}/plugin/cscope_maps.vim"
}

# vim:set ts=2 sw=2 et:
