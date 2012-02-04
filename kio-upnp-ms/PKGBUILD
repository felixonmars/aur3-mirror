pkgname=kio-upnp-ms
pkgver=0.8.0
pkgrel=1
pkgdesc="This is the UPnP MediaServer KIO-slave for the KDE platform"
arch=('i686' 'x86_64')
url="http://gitorious.net/kio-upnp-ms"
license=('GPL2')
depends=('herqq-svn-r55')
makedepends=('automoc4' 'cmake')

source=(
	"http://github.com/nikhilm/kio-upnp-ms/tarball/v0.8.0"
	"FindHUpnp.cmake"
	"CMakeLists-build-fix.patch"
)
sha256sums=(
	'c09a23423a8c761d9fad3bf88a5a57ce9b9f026cb6ca2be7dfb77570f3af9c47'
	'7c86b2e758a13c0a7d4dd6d5834736d5fa6046d418e81fb59402da84041b93d1'
	'6938e831cfbeadc5b3c12399f0e10c39498d72213ff639a5f8afe97d2971c3cf'
)

_dirname='nikhilm-kio-upnp-ms-2e86418';

build() {
	
	cd "$srcdir/$_dirname"
	mkdir -p "$srcdir/$_dirname/cmake/modules"
	cp "$srcdir/FindHUpnp.cmake" "$srcdir/$_dirname/cmake/modules"
	patch -p1 < "$srcdir/CMakeLists-build-fix.patch"
	mkdir build && cd build
	cmake ../ -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` || return 1
	make || return 1
	make DESTDIR="$pkgdir/" install || return 1
}

