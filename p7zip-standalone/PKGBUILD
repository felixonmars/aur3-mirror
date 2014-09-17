# $Id$
# Contributor: Thayer Williams <thayer at archlinux dot org>
# Contributor: Hugo Doria <hugo at archlinux dot org>
# Contributor: TuxSpirit<tuxspirit at archlinux dot fr>  2007/11/17 21:22:36 UTC
# Contributor: Daniel J Griffiths <ghost1227 at archlinux.us>
# Offical Maintainer: Gaetan Bisson <bisson at archlinux dot org>
# AUR Maintainer: BrainwreckedTech <paulhinchberger3 at gmail dot com>

# This PKGBUILD is a derivative of the p7zip package in the official repos.

pkgname=p7zip-standalone
pkgver=9.20.1
pkgrel=9
pkgdesc='Stand-alone CLI-only version of the 7zip compressed file archiver'
url='http://p7zip.sourceforge.net/'
license=('GPL' 'custom')
arch=('i686' 'x86_64')
depends=('gcc-libs' 'bash')
makedepends=('yasm' 'nasm')
conflicts=('p7zip' 'p7zip-light' 'p7zip-natspec' 'p7zip-fixzip')
source=("http://downloads.sourceforge.net/project/${pkgname:0:5}/${pkgname:0:5}/${pkgver}/${pkgname:0:5}_${pkgver}_src_all.tar.bz2")
sha1sums=('1cd567e043ee054bf08244ce15f32cb3258306b7')
options=('!makeflags')

prepare() {
        # Stop using ${pkgname:0:5} to keep more in line with original PKGBUILD
	mv "${srcdir}/${pkgname:0:5}_${pkgver}" "${srcdir}/${pkgname}_${pkgver}"

	cd "${srcdir}/${pkgname}_${pkgver}"
	rm GUI/kde4/p7zip_compress.desktop
	[[ $CARCH = x86_64 ]] \
	&& cp makefile.linux_amd64_asm makefile.machine \
	|| cp makefile.linux_x86_asm_gcc_4.X makefile.machine

	sed -i 's/wx-config/wx-config-2.8/g' CPP/7zip/TEST/TestUI/makefile \
		CPP/7zip/UI/{FileManager,GUI,P7ZIP}/makefile
}

build() {
	cd "${srcdir}/${pkgname}_${pkgver}"
        # Changed from make all4 to make 7zr
	make 7zr OPTFLAGS="${CXXFLAGS}"
}

package() {
	cd "${srcdir}/${pkgname}_${pkgver}"

        # Prevent documenting binaries that aren't included
        sed -i 's/.*man1\/7z[a]*.1"//g' install.sh

	make install \
		DEST_DIR="${pkgdir}" \
		DEST_HOME="/usr" \
		DEST_MAN="/usr/share/man"

	# Licenses
	install -d "${pkgdir}"/usr/share/licenses/p7zip
	ln -s -t "${pkgdir}"/usr/share/licenses/p7zip \
		/usr/share/doc/p7zip/DOCS/License.txt

	chmod -R u+w "${pkgdir}/usr"
}
