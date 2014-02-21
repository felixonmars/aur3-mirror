# Maintainer: NeoRaider <neoraider@universe-factory.net>

_pkgname=libxcb
pkgname=lib32-${_pkgname}-git
pkgver=1.10.r14.g4ffa6f8
pkgrel=1
pkgdesc="X11 client-side library (32-bit, git version)"
arch=(x86_64)
url="http://xcb.freedesktop.org/"
depends=('xcb-proto-git>=1.10.r4.g4270141' 'lib32-libxdmcp' 'lib32-libxau')
makedepends=('pkgconfig' 'libxslt' 'python' 'autoconf')
conflicts=('libx11<1.1.99.2' 'lib32-libxcb')
provides=('lib32-libxcb=$pkgver')
options=('!libtool')
license=('custom')
source=('git+http://anongit.freedesktop.org/git/xcb/libxcb.git')
sha512sums=('SKIP')
_gitname="libxcb"

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
	cd $srcdir/${_gitname}
	sed -i 's/pthread-stubs //' configure.ac
}

build() {
  cd "${srcdir}/$_gitname"
  export CC="gcc -m32"
	export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  ./autogen.sh \
		--prefix=/usr \
		--enable-xinput \
		--enable-xkb \
		--disable-static \
		--libdir=/usr/lib32
  make
}

package() {
  cd "${srcdir}/$_gitname"
  make DESTDIR="${pkgdir}" install
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
# vim:set ts=2 sw=2 bs=2:
