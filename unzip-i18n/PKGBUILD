# $Id$
# Maintainer: willwish <willwish@outlook.com>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: Robson Peixoto

pkgname=unzip-i18n
_pkgname=unzip
pkgver=6.0
_pkgver=${pkgver/./}
pkgrel=1
pkgdesc='For extracting and viewing files in .zip archives, support decoding of filenames in archives'
url='http://www.info-zip.org/UnZip.html'
arch=('i686' 'x86_64')
license=('custom')
depends=('bzip2' 'bash' 'libnatspec')
conflicts=('unzip')
provides=('unzip')
source=("http://downloads.sourceforge.net/infozip/${_pkgname}${_pkgver}.tar.gz" "unzip-6.0-natspec.patch")
sha1sums=('abf7de8a4018a983590ed6f5cbd990d4740f8a22' '06a6d07e3aac611f2326e6f57861ee4f45222d1b')

prepare() {
	cd "${srcdir}/${_pkgname}${_pkgver}"
	patch -p1 -i ${srcdir}/unzip-6.0-natspec.patch
	sed -i "/MANDIR =/s#)/#)/share/#" unix/Makefile
}

build() {
	cd "${srcdir}/${_pkgname}${_pkgver}"

	# DEFINES, make, and install args from Debian
	DEFINES='-DACORN_FTYPE_NFS -DWILD_STOP_AT_DIR -DLARGE_FILE_SUPPORT \
		-DUNICODE_SUPPORT -DUNICODE_WCHAR -DUTF8_MAYBE_NATIVE -DNO_LCHMOD \
		-DDATE_FORMAT=DF_YMD -DUSE_BZIP2 -DNOMEMCPY -DNO_WORKING_ISPRINT'

	make -f unix/Makefile prefix=/usr \
		D_USE_BZ2=-DUSE_BZIP2 L_BZ2=-lbz2 \
		CF="$CFLAGS $CPPFLAGS -I. $DEFINES" \
		unzips
}

package() {
	cd "${srcdir}/${_pkgname}${_pkgver}"
	make -f unix/Makefile prefix="${pkgdir}"/usr install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
