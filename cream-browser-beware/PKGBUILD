# Maintainer: Your Name <cpunltd at gmail dot com>

pkgname=cream-browser-beware
pkgver=1.0rc5
pkgrel=1
pkgdesc="A light web browser based on the layout engine WebKit and using the library GTK+."
arch=('i686' 'x86_64')
url="http://cream-browser.net"
license=('GPL')
groups=()
depends=('libwebkit' 'gtk2')
makedepends=()
optdepends=()
provides=()
conflicts=(cream-browser)
replaces=()
backup=()
options=()
install=
source=(http://downloads.sourceforge.net/project/cream-browser/cream-browser/1.0-rc5/cream-1.0-rc5.tar.gz)
noextract=()
md5sums=('3a37e0e4998c0b32378f88af94d21d26') #generate with 'makepkg -g'

build() {
  cd $srcdir/cream
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/cream
  make DESTDIR=$pkgdir install
}
