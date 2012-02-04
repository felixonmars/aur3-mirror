# Contributor: Nathan Owe. ndowens04 at gmail dot com	
pkgname=targui
pkgver=0.3_beta
pkgrel=1
pkgdesc="gui for tar"
arch=(i686)
url="http://targui.sourceforge.net/"
license=('GPL')
depends=()
makedepends=('make' 'gcc')
source=(http://downloads.sourceforge.net/sourceforge/targui/$pkgname-$pkgver.tar.bz2)
md5sums=('36bc4fe052984d5b1123e6962e45f0fc') #generate with 'makepkg -g'

build() {
  cd "$srcdir/$pkgname"
  qmake || return 1
  make || return 1
  make bindir=${pkgdir}/usr/bin mandir=${pkgdir}/usr/share/man \
install || return 1
}

# vim:set ts=2 sw=2 et:
