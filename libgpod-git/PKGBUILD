# Maintainer: Jonas Abrahamsson  <JKAbrams(at)aur>
# Contributor: Basil8   	 <Basil8(at)aur>
# Contributor: Nicolas Quienot   <niQo(at)aur>
# Contributor: Dustin Mays       <dork.fish.wat(at)gmail(dot)com>
# Contributor: Kenny Stocoff     <sogenfallen(at)hotmail(dot)com>
# Contributor: Prurigro          <prurigro(at)gmail(dot)com>
# Contributor: oke3              <Sekereg [at] gmx [dot] com>
# Contributor: Ivan Shapovalov   <intelfx100@gmail.com>
  
pkgname=libgpod-git
epoch=1
pkgver=0.8.3.0.g96a28b0
pkgrel=1
pkgdesc="A shared library used to access the contents of an iPod"
url="http://www.gtkpod.org/wiki/Libgpod"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('gdk-pixbuf2' 'mutagen' 'sg3_utils' 'libimobiledevice' 'libusbx')
makedepends=('intltool' 'swig' 'docbook-xsl' 'pygobject2-devel' 'gtk-sharp-2' 'gtk-doc')
optdepends=('gtk-sharp-2: Mono bindings')
options=('!libtool' '!emptydirs')
conflicts=('libgpod')
provides=('libgpod=0.8.2')
source=('git://gtkpod.git.sourceforge.net/gitroot/gtkpod/libgpod'
	'libgpod-git-archlinux.patch')
md5sums=('SKIP'
	 '0ef4a4d8090af6dcef000dd7356c3367')

pkgver() {
	cd libgpod

	local ver="$(git describe --long)"
	printf "%s" "${ver//-/.}"
}

prepare() {
	cd libgpod

	# 2013-10-19: updated patch due to new automake version
	patch -Np1 -i "$srcdir/libgpod-git-archlinux.patch"
}

build() {
	cd libgpod

	./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var --enable-udev
	make
}
 
package() {
	cd libgpod

	make DESTDIR="$pkgdir" install

	# 2013-10-19: more general fix for /lib -> /usr/lib move
	mkdir -p "$pkgdir/usr/lib"
	cp -aT "$pkgdir/lib" "$pkgdir/usr/lib"
	rm -rf "$pkgdir/lib"
}