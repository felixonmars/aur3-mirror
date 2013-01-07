# Maintainer: PyroPeter <pyropeter+aur@pyropeter.eu>

# contributors to avr-gcc:
# Contributor: schuay <jakob.gruber@gmail.com>
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: danst0 <danst0@west.de>

# Build order: h8300-hitachi-coff-binutils -> h8300-hitachi-coff-gcc

pkgname=h8300-hitachi-coff-gcc
pkgver=3.4.6
pkgrel=2
pkgdesc="The GNU Hitachi H8/300 Compiler Collection"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
url="http://gcc.gnu.org/"
depends=('h8300-hitachi-coff-binutils>=2.16.1' 'cloog' 'ppl' 'libmpc')
options=('!libtool' '!emptydirs' '!libtool' '!strip')
source=("http://ftp.gnu.org/gnu/gcc/gcc-$pkgver/gcc-$pkgver.tar.bz2"
	"64bit.patch"
	"no_libstdcppv3.patch")
md5sums=('4a21ac777d4b5617283ce488b808da7b' '82dfae583a59b36327c41a804feb792a' 'fd723c438f6a6d32e9d3cc3bee888b38')

build() {
	cd "$srcdir/gcc-$pkgver"

	patch -p1 < ../64bit.patch

	patch -p1 < ../no_libstdcppv3.patch
	rm configure
	autoconf

	cd "$srcdir"

	[ -e objdir ] && rm -r objdir
	mkdir objdir
	cd objdir

	CFLAGS='-O0 -g -D_FORTIFY_SOURCE=1'
	"../gcc-$pkgver"/configure \
		--prefix=/usr \
		--libdir=/usr/lib \
		--libexecdir=/usr/lib \
		--mandir=/usr/share/man \
		--infodir=/usr/share/info \
		--enable-languages=c,c++ \
		--disable-libssp \
		--target=h8300-hitachi-coff \
		--with-as=/usr/bin/h8300-hitachi-coff-as \
		--with-ld=/usr/bin/h8300-hitachi-coff-ld \
		--with-gnu-as \
		--with-gnu-ld \
		--disable-multilib \
		--enable-target-optspace

	make
}

package() {
	cd "$srcdir/objdir"

	make -j1 DESTDIR="$pkgdir" install

	rm -rf "$pkgdir"/usr/share/man/man7
	rm -rf "$pkgdir"/usr/share/info
	rm -rf "$pkgdir"/usr/share/locale
	rm "$pkgdir"/usr/lib/libiberty.a
}

