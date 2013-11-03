# Maintainer: Your Name <youremail@domain.com>
pkgname=openwfd-git
_name=openwfd
pkgver=48.c1fe726
pkgrel=1
#epoch=
pkgdesc="OpenWFD (openwfd_p2pd) is an Open-Source implementation of the Wifi-Display standard (abbr. WFD). It is also commonly known as Miracast. OpenWFD is currently under heavy development. It is not ready to be used, yet."
arch=('i686' 'x86_64')
url="http://www.freedesktop.org/wiki/Software/openwfd/"
license=('GPL')
#groups=()
#depends=()
#makedepends=()
#checkdepends=()
#optdepends=()
#provides=()
#conflicts=()
#replaces=()
#backup=()
#options=()
#install=
#changelog=
source=("$_name::git://people.freedesktop.org/~dvdhrm/openwfd")
#noextract=()
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
