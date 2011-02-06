# Contributor: Jens Pranaitis <jens@jenux.homelinux.org>
# Contributor: Janos Kovacs <janny@frugalware.org>
# Contributor: VMiklos <vmiklos@frugalware.org>

pkgname=sqlzma-tools
_realname=squashfs
pkgver=3.4
lzmaver=457
pkgrel=4
url="http://www.squashfs-lzma.org"
pkgdesc="A highly compressed read-only filesystem for Linux."
depends=('kernel26>=2.6.29' 'kernel26<2.6.30' 'sqlzma' 'zlib')
license=('GPL')
provides=('squashfs-tools')
conflicts=('squashfs-tools')
arch=('i686' 'x86_64')
source=(http://frugalware.org/~janny/source_pkgs/lzma${lzmaver}.tar.bz2 \
        http://frugalware.org/~janny/source_pkgs/${_realname}${pkgver}.tar.gz \
        http://frugalware.org/~janny/source_pkgs/sqlzma${pkgver}-${lzmaver}.tar.bz2 \
        squashfs-lzma.tar.gz \
	squashfs3.4-include-patch)
md5sums=('fc7a12a396ade1772e959604d6eb31e1'
         '2a4d2995ad5aa6840c95a95ffa6b1da6'
         '0e7201a040fa9372e9b33f3abdbe19c9'
         'd7c53db305d77701cd2298e2845adb13'
         '2ed00248c56672a6664864084011e85a')
_kernver='2.6.29-ARCH'
_kdir="${pkgdir}"/lib/modules/${_kernver}/kernel/fs/${_realname}

build()
{
	cd "${srcdir}"
	ls > foo
	echo "applying squashfs3.4-include-patch"
	cp -Raf /usr/src/linux-$_kernver ${startdir}/src
	cd linux-${_kernver}
	patch -p1 < ../squashfs3.4-include-patch || return 1
	echo "applying sqlzma2u-3.4.patch"
	patch -p0 < ${srcdir}/sqlzma2u-3.4.patch || return 1

	if [ "$CARCH" == "x86_64" ]; then
		sed -i 's/-Werror//' ${srcdir}/sqlzma1-${lzmaver}.patch || return 1
		sed -i 's/-Werror//' ${srcdir}/Makefile || return 1
	fi
	
	echo "applying sqlzma1-${lzmaver}.patch"
	patch -p1 < "${srcdir}"/sqlzma1-${lzmaver}.patch || return 1
	
	cd "${srcdir}" || return 1
	
	echo "sed Makefile"
	sed -i "s|KDir =.*|KDir = "${startdir}"/src/linux-$_kernver|" Makefile || return 1
	sed -i "s|SqFs =.*|SqFs = "${startdir}"/src/squashfs|" Makefile || return 1
	sed -i "s/LzmaVer =.*/LzmaVer = ./" Makefile || return 1
	#sed -i "s/C=1/C=0/" Makefile || return 1
	
	echo "Compiling"
	make || return 1
	
	echo "Installing files"
	mkdir -p "${pkgdir}"/sbin
	install -D -m 755 squashfs${pkgver/_/-}/squashfs-tools/{mk,un}squashfs ${pkgdir}/sbin/
}
