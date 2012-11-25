pkgname=p7zip-light
_pkgname=${pkgname%-light}
pkgver=9.20.1
pkgrel=3
pkgdesc='Command-line version of the 7zip compressed file archiver without Rar and GUI'
url='http://p7zip.sourceforge.net/'
license=('GPL')
arch=('i686' 'x86_64')
depends=('gcc-libs' 'sh')
optdepends=()
makedepends=('yasm' 'nasm')
source=("http://downloads.sourceforge.net/project/${_pkgname}/${_pkgname}/${pkgver}/${_pkgname}_${pkgver}_src_all.tar.bz2"
        'p7zip-libre.patch')
provides=("p7zip=${pkgver}")
conflicts=('p7zip')
replaces=('p7zip')
sha1sums=('1cd567e043ee054bf08244ce15f32cb3258306b7'
          '8fc0e6e80aeec371a8c80e7a6082594ac6d08aed')

build() {
	cd "${srcdir}/${_pkgname}_${pkgver}"

	patch -p1 -i ${srcdir}/p7zip-libre.patch

	[[ $CARCH = x86_64 ]] \
	&& cp makefile.linux_amd64_asm makefile.machine \
	|| cp makefile.linux_x86_asm_gcc_4.X makefile.machine

	make all3 OPTFLAGS="${CXXFLAGS}"
}

package() {
	cd "${srcdir}/${_pkgname}_${pkgver}"

	make install \
		DEST_DIR="${pkgdir}" \
		DEST_HOME="/usr" \
		DEST_MAN="/usr/share/man"

	# Integration with stuff...
	ln -s 7zCon.sfx "${pkgdir}"/usr/lib/p7zip/7z.sfx

	chmod -R u+w "${pkgdir}/usr"
}
