# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
pkgname=vim-doc-pl
pkgver=1.0
pkgrel=3
pkgdesc="The VIM Polish document"
arch=('any')
url="http://skawina.eu.org/mikolaj"
license=('GPL')
depends=('vim-runtime')
makedepends=('unzip')
install="vimdoc.install"
source=(http://dracorp.one.pl/vim/usr_doc_pl.zip)
build() {
  cd "$srcdir"
  _version_vimruntime=$(pacman -Q vim-runtime | awk \
  '{$0=gensub(/^[^0-9]*([0-9])\.([0-9]).*/,"\\1\\2","1");print }')
  install -dm755 ${pkgdir}/usr/share/vim/vim${_version_vimruntime}/doc || return 1
  install -Dm644 ${srcdir}/*.plx ${pkgdir}/usr/share/vim/vim${_version_vimruntime}/doc/ || return 1
}
# vim:set ts=2 sw=2 et ft=sh tw=100:

md5sums=('ff96284b1c913d55cf0877839b34d490')
