# Maintainer: olantwin <olantwin at gmail dot com>
pkgname=vim-airline
pkgver=0.7
pkgrel=1
pkgdesc="A lean & mean statusline for vim that's light as air. Release version."
arch=(any)
url="https://github.com/bling/vim-airline"
license=('MIT')
groups=()
depends=('vim-runtime')
optdepends=('otf-powerline-symbols-git: Use the Powerline symbols')
makedepends=()
install=vimdoc.install
source=("v${pkgver}.tar.gz"::"https://github.com/bling/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('d326bede85efe18d7b83732d0d9b5444')

package() {
  cd "$pkgname-$pkgver"
  _installpath="${pkgdir}/usr/share/vim/vimfiles"
  install -Dm755 doc/airline.txt ${_installpath}/doc/airline.txt
  install -Dm755 plugin/airline.vim ${_installpath}/plugin/airline.vim
  mkdir -p ${_installpath}/autoload
  mkdir -p ${_installpath}/t
  cp -R autoload/* ${_installpath}/autoload
  cp -R t/* ${_installpath}/t
}
