pkgname=gbemol
pkgver=0.3.2
pkgrel=1
pkgdesc="A GTK+ interface for MPD with a nice library browser"
url="http://gbemol.sourceforge.net"
arch=(i686 x86_64)
license=('GPL')
depends=('gtk2>=2.10.0' 'curl' 'libxml2')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
install=
source=(http://ufpr.dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('96de39499201725ae89da165dfb6f7ec')
build() {
   cd $startdir/src/$pkgname-$pkgver
   ./configure --prefix=/usr
   make || return 1
   make DESTDIR=$startdir/pkg install
}
