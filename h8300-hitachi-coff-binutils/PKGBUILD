# Maintainer: PyroPeter <pyropeter+aur # pyropeter ; eu>

# Contributors to avr-binutils:
# Contributor: schuay <jakob.gruber@gmail.com>
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: danst0 <danst0@west.de>

# Build order: h8300-hitachi-coff-binutils -> h8300-hitachi-coff-gcc

pkgname=h8300-hitachi-coff-binutils
pkgver=2.16.1
pkgrel=2
pkgdesc="A set of programs to assemble and manipulate binary and object files for the Hitachi H8/300 architecture"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/binutils/"
license=('GPL')
depends=('glibc>=2.16' 'zlib')
options=('!libtool' '!distcc' '!ccache')
install=$pkgname.install
source=("http://ftp.gnu.org/gnu/binutils/binutils-$pkgver.tar.bz2"
	"sprintf.patch")
md5sums=('f4f3d732697af0368ecfdadb8ea77285' '9d675527932bd0dc58036298adb13327')

build() {
	cd "$srcdir/binutils-$pkgver"

	patch -p1 < ../sprintf.patch

	config_guess=$(./config.guess)

	rm -rf objdir
	mkdir objdir && cd objdir

	CFLAGS='-O0 -g -D_FORTIFY_SOURCE=1'
	../configure \
		--prefix=/usr \
		--includedir=/usr/${config_guess}/include \
		--infodir=/usr/share/info \
		--libdir=/usr/lib \
		--mandir=/usr/share/man \
		--build=${config_guess} \
		--target=h8300-hitachi-coff \
		--disable-nls

	# This checks the host environment and makes sure all the necessary tools are available to compile Binutils.
	make configure-host

	make tooldir="$pkgdir/usr"
}

package() {
	cd "$srcdir/binutils-$pkgver/objdir"

	make DESTDIR="$pkgdir" tooldir=/usr install

	cd "$pkgdir"

	rm -f usr/lib/libiberty.a

	find usr/bin -regex '[^-]*' -type f -exec rm {} \;

	for info in `find usr/share/info -name '*.info*'`; do
		newinfo=`echo $info | sed 's!.*/!\0h8300-hitachi-coff-!'`
		mv $info $newinfo
	done
}

