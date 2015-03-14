# Maintainer: Your Name <youremail@domain.com>
pkgname=miraclecast-git
_name=miraclecast
pkgver=108.5fc9133
pkgrel=1
#epoch=
pkgdesc="MiracleCast provides software to connect external monitors to your system via Wifi. It is compatible to Miracast. Link-management works, everything else is still being worked on. Replaces openwfd."
arch=('i686' 'x86_64')
url="http://www.freedesktop.org/wiki/Software/miracle/"
license=('GPL')
#groups=()
depends=("systemd" "kdbus") #kdbus-git provides kdbus
#makedepends=()
#optdepends=()
provides=("miraclecast")
#conflicts=()
source=("$_name::git://people.freedesktop.org/~dvdhrm/miracle")
md5sums=('SKIP') #generate with 'makepkg -g'

#prepare() {
#	cd "$srcdir/$_name"
#	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
#}

build() {
	cd "$srcdir/$_name"
	#./configure --prefix=/usr
	./autogen.sh --prefix=/usr
	make
}

check() {
	cd "$srcdir/$_name"
	make -k check
}

package() {
	cd "$srcdir/$_name"
	make DESTDIR="$pkgdir/" install
}
pkgver() {
  cd "$srcdir/$_name"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}
