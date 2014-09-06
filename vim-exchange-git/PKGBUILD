# Maintainer: PedsXing <pedsxing@gmx.net>
_name=vim-exchange
pkgname="${_name}-git"
pkgver=f841536
pkgrel=1
pkgdesc='Easy text exchange operator for Vim.'
arch=('any')
url='https://github.com/tommcdo/vim-exchange'
license=('custom:vim')
groups=('vim-plugins')
depends=('vim')
conflicts=('vim-exchange')
provides=('vim-exchange')
makedepends=('git')
install='vimdoc.install'
source=("${_name}::git://github.com/tommcdo/${_name}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_name}"
  echo "$(git describe --always|cut -d 'v' -f2|sed -e 's|-|.|g' )"
}

package() {
  cd "${srcdir}/${_name}"

  installpath="${pkgdir}/usr/share/vim/vimfiles"

  install -Dm644 doc/exchange.txt "$installpath/doc/exchange.txt"
  install -Dm644 plugin/exchange.vim "$installpath/plugin/exchange.vim"
}
