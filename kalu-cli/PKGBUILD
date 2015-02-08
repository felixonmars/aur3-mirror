# Maintainer: firegore
_pkgname=kalu
pkgname=$_pkgname-cli
pkgdir=kalu
pkgver=3.0.0
pkgrel=7
pkgdesc="Upgrade notifier w/ AUR support, watched (AUR) packages, news [GIT]"
arch=('i686' 'x86_64')
url="http://jjacky.com/kalu"
license=('GPL3+')
provides=('kalu')
conflicts=('kalu' 'kalu-git' 'kalu-cli-git')
depends=('pacman>=4.2' 'pacman<4.3' 'curl' )
makedepends=('perl' 'groff' 'git')
source=("git://github.com/jjk-jacky/kalu.git#branch=next")
install=kalu.install
sha1sums=('SKIP')

build() {
  cd "$srcdir/$_pkgname"
  ./autogen.sh
  ./configure --prefix=/usr --disable-gui
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
