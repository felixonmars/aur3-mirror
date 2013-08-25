# Contributor : Keshav P R <(the.ridikulus.rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Thomas Bächler <thomas.archlinux.org>

_pkgname=ntfs-3g
pkgname=ntfs-3g_ntfsprogs-git
pkgver=4695.db35a16
pkgrel=1
pkgdesc="Read and write NTFS driver and utilities - GIT version"
url="http://www.tuxera.com"
arch=('i686' 'x86_64')
license=('GPL2')
makedepends=('pkgconfig')
depends=('glibc' 'fuse' 'util-linux')
conflicts=("${_pkgname}" 'ntfs-3g' 'ntfsprogs' 'ntfs-3g-ar')
provides=("${_pkgname}" 'ntfs-3g' 'ntfsprogs' 'ntfs-3g-ar')
options=(strip !emptydirs zipman !libtool docs)
source=('git://ntfs-3g.git.sourceforge.net/gitroot/ntfs-3g/ntfs-3g#branch=edge')
md5sums=('SKIP')


pkgver() {
	cd $_pkgname
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
	cd $_pkgname
	sed -i 's|$(DESTDIR)/sbin|$(DESTDIR)/usr/bin|' {ntfsprogs,src}/Makefile.am
}

build() {
	cd "${srcdir}/${_pkgname}"
	
	./autogen.sh
	ac_cv_path_LDCONFIG="/bin/true" ./configure \
		--prefix="/usr" \
		--with-fuse="external" \
		--disable-static \
		--mandir="/usr/share/man" \
		--enable-posix-acls \
		--enable-xattr-mappings \
		--enable-extras
	make	
}

package() {
	cd "${srcdir}/${_pkgname}"
	
	make DESTDIR="$pkgdir" rootbindir=/usr/bin rootsbindir=/usr/bin rootlibdir=/usr/lib install
	ln -s /usr/bin/ntfs-3g "$pkgdir/usr/bin/mount.ntfs"
	
	#install -d "${pkgdir}/lib"
	
	#for DIR in src libntfs-3g include ntfsprogs; do
	#	cd "${srcdir}/${_pkgname}_build/${DIR}/"
	#	make DESTDIR="${pkgdir}" install
	#done
	
	#install -d "${pkgdir}/usr/lib"
	#install -d "${pkgdir}/usr/bin"
	
	#mv "${pkgdir}/lib"/* "${pkgdir}/usr/lib"/
	#mv "${pkgdir}/bin"/* "${pkgdir}/usr/bin"/
	#mv "${pkgdir}/sbin"/* "${pkgdir}/usr/bin"/
	
	#rm -rf "${pkgdir}/lib"
	#rm -rf "${pkgdir}/bin"
	#rm -rf "${pkgdir}/sbin"
	
	#cd "${srcdir}/${_gitname}_build/"
	
	#rm -f "${pkgdir}/usr/bin/mount.ntfs"
	#rm -f "${pkgdir}/usr/bin/mount.ntfs-3g"
	#ln -s "/usr/bin/ntfs-3g" "${pkgdir}/usr/bin/mount.ntfs"
	#ln -s "/usr/bin/ntfs-3g" "${pkgdir}/usr/bin/mount.ntfs-3g"
	
	#rm -f "${pkgdir}/usr/bin/fsck.ntfs"
	#rm -f "${pkgdir}/usr/bin/fsck.ntfs-3g"
	#ln -s "/usr/bin/ntfsck" "${pkgdir}/usr/bin/fsck.ntfs"
	#ln -s "/usr/bin/ntfsck" "${pkgdir}/usr/bin/fsck.ntfs-3g"
}
