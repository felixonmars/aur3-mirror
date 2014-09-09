# $Id$
# Maintainer:  Eric Bélanger <eric@archlinux.org>
# Contributor: Smith Dhumbumroong <zodmaner@gmail.com>

pkgname=lcs
pkgver=4.07r652
pkgrel=1
pkgdesc="Liberal Crime Squad: A satirical console-based political role-playing/strategy game in which you recruit a team of Elite Liberal radicals and try to save the United States from a descent into Arch-Conservatism."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/lcsgame/"
license=('GPL2')
depends=('ncurses')
makedepends=('autoconf')
install='install'
source=("http://cwaddell.com/downloads/lcsgame-code-652-trunk.zip")

build() {
  cd "${srcdir}/lcsgame-code-652-trunk"
  chmod 744 bootstrap

  ./bootstrap
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/lcsgame-code-652-trunk"

  mkdir -p "${pkgdir}/usr/share/lcs"
  cp -R art "${pkgdir}/usr/share/lcs/"
  chmod 644 "${pkgdir}/usr/share/lcs/art/"*

  install -D -m 755 "${srcdir}/lcsgame-code-652-trunk/src/crimesquad" "${pkgdir}/usr/bin/crimesquad"
}

sha256sums=('9cf4057fc0f0e6ae47445f55bbd0255e597343618282075b005dc71333741d53')
