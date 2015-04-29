# Maintainer: Rhinoceros

pkgname=vim-startify
pkgver=1.8
pkgrel=1
pkgdesc='A fancy start screen for Vim.'
arch=('any')
url='https://github.com/mhinz/vim-startify'
license=('MIT')
depends=('vim')
groups=('vim-plugins')
install='vimdoc.install'
source=("https://github.com/mhinz/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('0fb90910f1c1ca208c5967e9400870b5ea1d59941df7e21a883a8aff5fddcfbf')

package() {
  cd $pkgname-$pkgver
  _installpath="${pkgdir}/usr/share/vim/vimfiles"
  install -d "${_installpath}/"{autoload,doc,plugin,syntax}
  install -m644 autoload/startify.vim "${_installpath}/autoload/"
  install -m644 doc/startify.txt "${_installpath}/doc/"
  install -m644 plugin/startify.vim "${_installpath}/plugin/"
  install -m644 syntax/startify.vim "${_installpath}/syntax/"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
