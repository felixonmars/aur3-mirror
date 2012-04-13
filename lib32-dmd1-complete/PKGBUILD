pkgname=lib32-dmd1-complete
mypkgname=lib32-dmd1
pkgver=1.066
pkgrel=2
pkgdesc="Runtime library for the D programming language including libphobos, compiled from source"
arch=('x86_64')
url="http://www.digitalmars.com/d/1.0/"
install="${mypkgname}.install"
source=(http://ftp.digitalmars.com/dmd.${pkgver}.zip
	stackelf.patch
	makefile.patch
	slotcompat.patch)
depends=()
makedepends=(unzip)
license=('custom')
conflicts=('libtango1' 'dmd1' 'libphobos1')
provides=('dmd1' 'libphobos1')
md5sums=('fd2c3f8dd46d0fe4597e9d96b4ab86b2'
         'e1154aeeb871b12cb59c76cfe207ab2e'
         '452824c5c619c637775dc81bfa245f9c'
         '48d97c5d156caf6012250a5e096cb107')

build() {
## Prepare Source

	# apply patches
	patch -p0 -i "${srcdir}"/stackelf.patch
	patch -p0 -i "${srcdir}"/makefile.patch
	patch -p0 -i "${srcdir}"/slotcompat.patch

	# remove unnecessary files
	cd "${srcdir}"/dmd
	rm -r freebsd html osx linux/lib/* \
	linux/bin/{README.TXT,dmd,dmd.conf} windows \
	samples README.TXT
	

## Make Source
	
	# filer out --as-needed
	export LDFLAGS="${LDFLAGS//-Wl,--as-needed}"
	export LDFLAGS="${LDFLAGS//,--as-needed}"
	export LDFLAGS="${LDFLAGS//--as-needed}"
	
	# make dmd
	cd "${srcdir}"/dmd/src/dmd
	make -f linux.mak
	cp dmd idgen impcnvgen optabgen "${srcdir}"/dmd/linux/bin
	chmod +x ../../linux/bin/dmd

	# make phobos
	cd "${srcdir}"/dmd/src/phobos
	# zlib 1.2.5 will be statically linked
	make -j1 -f linux.mak "DMD="${srcdir}"/dmd/linux/bin/dmd"
	cp libphobos.a "${srcdir}"/dmd/linux/lib

	# Clean up
	cd "${srcdir}"/dmd/src/dmd
	make -f linux.mak clean
	find "${srcdir}"/dmd \( -name "*.c" -o -name "*.h" -o -name "*.mak" \
	-o -name "*.obj" -o -name "*.ddoc" -o -name "*.asm" \) -exec rm -v {} \;

}

package() {

## Install

	# Lib
	install -Dm644 "${srcdir}"/dmd/linux/lib/libphobos.a "${pkgdir}"/usr/lib32/libphobos.a

	# dmd compiler
	install -Dm755 "${srcdir}"/dmd/linux/bin/dmd "${pkgdir}"/usr/bin/dmd
	install -Dm755 "${srcdir}"/dmd/linux/bin/dumpobj "${pkgdir}"/usr/bin/dumpobj
	install -Dm755 "${srcdir}"/dmd/linux/bin/obj2asm "${pkgdir}"/usr/bin/obj2asm
	install -Dm755 "${srcdir}"/dmd/linux/bin/rdmd "${pkgdir}"/usr/bin/rdmd

	# Build new dmd.conf
	cd "${srcdir}"/dmd
	cat > dmd1.conf << END
[Environment]
DFLAGS=-I/usr/include/d -L-L/usr/lib32
END
	install -Dm644 "${srcdir}"/dmd/dmd1.conf "${pkgdir}"/etc/dmd1.conf
	
	# Includes
	install -d "${pkgdir}"/usr/include/d
	cd "${srcdir}"/dmd/src/phobos
	cp -Rf std "${pkgdir}"/usr/include/d
	cp -Rf etc "${pkgdir}"/usr/include/d
	cp -Rf internal "${pkgdir}"/usr/include/d
	cp -f {crc32,object,gcstats}.d "${pkgdir}"/usr/include/d

	# Get rid of this subdirectory; it's just an unpacked zlib source
	# distribution.
	rm -rf "${pkgdir}"/usr/include/d/etc/c/zlib
	
	# Insure that files and directories under /usr/include/d have
	# correct permissions.
	find "${pkgdir}/usr/include/d" -type d -print0 |xargs -0 chmod 755
	find "${pkgdir}/usr/include/d" -type f -print0 |xargs -0 chmod 644
	install -Dm644 "${srcdir}"/dmd/license.txt "${pkgdir}"/usr/share/licenses/${mypkgname}/LICENSE

	# manpages
	for x in "${srcdir}"/dmd/man/man1/*.1; do
		install -Dm644 "$x" "$pkgdir/usr/share/man/man1/$(basename "$x")"
	done

	for x in "${srcdir}"/dmd/man/man1/*.5; do
		install -Dm644 "$x" "$pkgdir/usr/share/man/man5/$(basename "$x")"
	done
}