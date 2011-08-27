# Contributor: lol2Fast4U <lol2fast4u@gmail.com>
pkgname=logjam
pkgver=4.5.3
pkgrel=1
pkgdesc="GTK2 LiveJournal client"
arch=(i686)
url="http://logjam.danga.com"
license=('GPL2')
depends=(gtk2 pango cairo libxml2)
makedepends=(gcc libtool)
provides=(logjam liblivejournal)
conflicts=()
replaces=()
backup=()
groups=()
options=()
install=
source=(http://logjam.danga.com/download/logjam-$pkgver.tar.bz2)
noextract=()
md5sums=('48092c00e1f40ebee431b4e0071ae273')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}

