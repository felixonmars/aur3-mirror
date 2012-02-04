# Maintainer: Omar Campagne Polaino <ocampagne at gmail com>

pkgname=vim-doc-es
pkgver=0.5
pkgrel=1
pkgdesc="Vim help files translation to Spanish"
arch=('any')
url="http://www.assembla.com/wiki/show/vim-doc-es"
license=('custom:Open Publication License')
depends=('vim-runtime')
install="vimdoc.install"
changelog="ChangeLog"
source=(vim-doc-es_$pkgver.tar.gz::http://www.assembla.com/spaces/vim-doc-es/documents/blzXxIa4qr4lGNeJe5cbLr/download?filename=vim-doc-es_$pkgver.tar.gz
	'LICENSE')
md5sums=('8ce7f38eb662c7c10a32c940cbcc3826'
         'bc241636751ce433da8d6661a1946b2b')

build() {
  cd "$srcdir"
  _version_vimruntime=$(pacman -Q vim-runtime | awk \
  '{$0=gensub(/^[^0-9]*([0-9])\.([0-9]).*/,"\\1\\2","1");print }')
  install -dm755 ${pkgdir}/usr/share/licenses/vim-doc-es/ || return 1
  install -m644  ../LICENSE ${pkgdir}/usr/share/licenses/vim-doc-es/ || return 1
  install -dm755 ${pkgdir}/usr/share/vim/vim${_version_vimruntime}/doc || return 1
  install -Dm644 ${srcdir}/${pkgname}/*.esx ${pkgdir}/usr/share/vim/vim${_version_vimruntime}/doc/ || return 1 
}
