# Maintainer: Your Name <youremail@domain.com>
pkgname=miraclecast-libwfd-git
_name=libwfd
pkgver=15.21a82b9
pkgrel=1
#epoch=
pkgdesc="libwfd provides a stand-alone implementation of the Wifi-Display protocol. It is developed as part of MiracleCast, but doesn't have any of its heavy dependencies."
arch=('i686' 'x86_64')
url="http://www.freedesktop.org/wiki/Software/miracle/libwfd/"
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
source=("$_name::git://people.freedesktop.org/~dvdhrm/libwfd")
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
