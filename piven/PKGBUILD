pkgname=piven
pkgver=0.3
pkgrel=3
pkgdesc="Piven is a desktop orientated binary Usenet client with support for NZB files and SSL connections."
arch=(i686 x86_64)
url="http://piven.sourceforge.net"
depends=('qt' 'qwt' 'openssl')
makedepends=('cmake')
optdepends=('gtk-qt-engine: for nice looking GUI under Gnome')
source=(http://downloads.sourceforge.net/project/piven/Piven-0.3.tar.gz)
license=('gpl')
md5sums=('9b5afd6515de8f5c5141280d6c963876')

build() {
	cd Piven
	cmake . || return 1
	make || return 1
	make DESTDIR=${pkgdir} install || return 1
}