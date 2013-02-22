# Maintainer: Rohit R <rrohit.rht@gmail.com>
pkgname=playedit
pkgver=0.1.6
pkgrel=1
pkgdesc="Graphical interface for managing playlists on MTP devices."
arch=('any')
url="http://playedit.sourceforge.net/"
license=('GPL')
depends=('gtkmm3' 'libmtp' 'mpg123' 'gnome-doc-utils')
makedepends=('intltool>=0.35')
optdepends=()
provides=('playedit')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2)
noextract=()
md5sums=('11ae0a7edfe306069e9f47ae5f630301')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
