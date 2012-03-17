# Contributor : Alessio 'mOLOk' Bolognino <themolok at gmail dot com>

pkgname=refit
pkgver=0.14
pkgrel=2
pkgdesc="A GUI bootloader for Apple-Intel Macs and other (U)EFI based systems"
arch=('i686' 'x86_64')
license=('BSD')
depends=('glibc' 'gnu-efi')
url="http://refit.sourceforge.net"
source=("http://downloads.sourceforge.net/refit/refit-src-${pkgver}.tar.gz"
'debian_version_string.patch'
'disable_EFI110_features.patch'
'efi_call_wrappers.patch'
'fat_binaries_build.patch'
'gptsync_64bit_fix.patch'
'gptsync_biosboot.patch'
'gptsync_dont_truncate.patch'
'gptsync_manpage.patch'
'gptsync_nom_nom_nom_newline.patch'
'gptsync_quiet_mode.patch'
'gptsync_uefi_call_wrapper.patch'
'kfreebsd.patch'
'libeg_uefi_call_wrapper.patch'
'refit_uefi_call_wrapper.patch')

md5sums=('16f02fa5b5decdee17eebd5cd863b3f0'
'77836eac2fb9a516b6419a5626da2ff8'
'963e60a7c76c16efcc06a9458c7433df'
'637cc546477679e6fd96e41d33ca2d1c'
'b4484ff0f3842c53f58664ad4e458ac2'
'31b29bfdb8735915593190f85d654b81'
'816d96a32ffec0cc2a754dc9fc0e80b6'
'8ff420010c983070d5388d507feed6bc'
'195243753020fe8ac212bd8f6c6665b2'
'eb2144077fe404bf9c4eed8ca37ce56f'
'3b249b4535632b0afa14bb4388d6f529'
'da11c0156173e9f641d33c52bc86e6d8'
'70d46c29d290d5f6bc3c7425b97faee9'
'806ad695422a905b49a7f18f9a463620'
'203b72a874a1bedfe1db3b6ba13ee6bb')

build() {
    cd "${srcdir}/refit-src-${pkgver}"

	# patch a lot of stuff, all taken from debian
	patch -Np1 -i "$srcdir/gptsync_64bit_fix.patch"
	patch -Np1 -i "$srcdir/gptsync_nom_nom_nom_newline.patch"
	patch -Np1 -i "$srcdir/kfreebsd.patch"
	patch -Np1 -i "$srcdir/fat_binaries_build.patch"
	patch -Np1 -i "$srcdir/debian_version_string.patch"
	patch -Np1 -i "$srcdir/gptsync_quiet_mode.patch"
	patch -Np1 -i "$srcdir/gptsync_manpage.patch"
	patch -Np1 -i "$srcdir/gptsync_dont_truncate.patch"
	patch -Np1 -i "$srcdir/gptsync_biosboot.patch"
	patch -Np1 -i "$srcdir/disable_EFI110_features.patch"
	patch -Np1 -i "$srcdir/efi_call_wrappers.patch"
	patch -Np1 -i "$srcdir/gptsync_uefi_call_wrapper.patch"
	patch -Np1 -i "$srcdir/refit_uefi_call_wrapper.patch"
	patch -Np1 -i "$srcdir/libeg_uefi_call_wrapper.patch"

    make -C libeg
    make -C refit

    make -C gptsync -f Makefile.gnuefi
    #rm ${srcdir}/refit-src-${pkgver}/gptsync/gptsync.o

	make -C gptsync -f Makefile.unix
}

package() {
    cd "${srcdir}/refit-src-${pkgver}"

    install -Dm755 "${srcdir}/refit-src-${pkgver}/gptsync/gptsync" "${pkgdir}/sbin/gptsync"
    install -Dm644 "${srcdir}/refit-src-${pkgver}/refit/refit.efi" "${pkgdir}/usr/lib/refit/refit/refit.efi"
    install -Dm644 "${srcdir}/refit-src-${pkgver}/gptsync/gptsync.efi" "${pkgdir}/usr/lib/refit/tools/gptsync.efi"

    # install the man page
    install -Dm644 "${srcdir}/refit-src-${pkgver}/gptsync/gptsync.8" "${pkgdir}/usr/share/man/man8/gptsync.8"

    # install the license
    install -Dm644 "${srcdir}/refit-src-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/refit/LICENSE"

}
