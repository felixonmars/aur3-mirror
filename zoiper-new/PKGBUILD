# Maintainer: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: Aliaksandr Stelmachonak <mail.avatar@gmail.com>

pkgname=zoiper-new
pkgver=3.3
pkgrel=1
pkgdesc="An IAX and SIP VoIP softphone - New version"
arch=("i686" "x86_64")
url="http://www.zoiper.com/"
license=("custom")
depends=("gtk2" "alsa-lib" "libxdamage")
conflits=("zoiper")
[ "$CARCH" = "x86_64" ] && ARCH=64 || ARCH=32
[ "$CARCH" = "x86_64" ] && depends=("lib32-gtk2" "lib32-alsa-lib" "lib32-libxdamage" "lib32-libsm" "lib32-pangox-compat" "lib32-libcanberra")
source=("LICENSE" "zoiper-24.png" "zoiper-48.png" "zoiper-96.png" "zoiper.desktop" "zoiper.png")
sha1sums=('0c314f4b19979aad2f91ee2fbfd569f6870a2a31'
        '1a0f4c83c6b538584865df327702f800689493b0'
        '7fef1f81c32fc4be2d876fadf34178f60ea0a29e'
        '11fb63a8353353d28288a644aeb4cdf9a3ab3e8c'
        '056377817113ef6eda07b6e77519a814c5a0789f'
        'c1eea005beb7587b24b0a0d242eebc49a67f9026')

build() {
	cd "${srcdir}"

	# Tests
	if ! test -e ${startdir}/Zoiper_${pkgver}_Linux_Free_32Bit_64Bit.tar.gz; then
		# Messages
		warning "There is no longer a direct download link for the Zoiper tarball.  Get it manually from: www.zoiper.com/en/voip-softphone/download/zoiper3"
		return 1
	fi

	tar xfz Zoiper_${pkgver}_Linux_Free_32Bit_64Bit.tar.gz
}

package() {
	cd "${srcdir}"
	install -d "${pkgdir}"/usr/bin "${pkgdir}"/usr/share/{applications,pixmaps} "${pkgdir}"/usr/share/licenses/zoiper "${pkgdir}"/usr/lib/zoiper
	./Zoiper_${pkgver}_Linux_Free_${ARCH}Bit.run --mode unattended --prefix "${pkgdir}"/usr/lib/zoiper || true
	chmod 755 "${pkgdir}"/usr/lib/zoiper/zoiper
	install -m644 zoiper-24.png "${pkgdir}"/usr/share/pixmaps/
	install -m644 zoiper-48.png "${pkgdir}"/usr/share/pixmaps/
	install -m644 zoiper-96.png "${pkgdir}"/usr/share/pixmaps/
	install -m644 zoiper.png "${pkgdir}"/usr/share/pixmaps/
	install -m644 zoiper.desktop "${pkgdir}"/usr/share/applications/
	install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/zoiper/LICENSE
	ln -sr "${pkgdir}"/usr/lib/zoiper/zoiper "${pkgdir}"/usr/bin
}
