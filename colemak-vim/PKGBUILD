# Maintainer: Uwe H <moc liamg skcuneelu <-- backwards>
# Contributor: Sorin Ionescu <sorin.ionescu@gmail.com>
pkgname=colemak-vim
pkgver=20110517
pkgrel=1
pkgdesc="Colemak keyboard layout for vim by Shai Coleman"
arch=('any')
url="http://colemak.com"
license=('Public Domain')
depends=('vim')
install=${pkgname}.install
source=(colemak.vim)
md5sums=('47199294165ecfa2a31ee0a8b0ecf074')

package () {
  install -Dm644 "${srcdir}/colemak.vim" "${pkgdir}/usr/share/vim/vimfiles/keymap/colemak.vim"
}

# vim:set ts=2 sw=2 et:
