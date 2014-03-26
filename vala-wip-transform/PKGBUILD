pkgname=vala-wip-transform
pkgver=0.24.0.6.f6d8
pkgrel=1
pkgdesc="Compiler for the GObject type system. wip/transform branch."
arch=('i686' 'x86_64')
url="http://live.gnome.org/Vala"
license=('LGPL')
depends=('glib2')
makedepends=('libxslt')
provides=('vala')
conflicts=('vala')
source=('git://git.gnome.org/vala')
sha256sums=('SKIP')

pkgver() {
	cd vala
	./build-aux/git-version-gen . | sed -e 's/\-/\./'
}

build() {
	cd vala
	git checkout wip/transform
	./autogen.sh --prefix=/usr --enable-vapigen
	make
}

package() {
    cd vala
    make DESTDIR="$pkgdir" install
}
