# Maintainer: Stephen Zhang <zsrkmyn at gmail dot com>

########################################### NOTICE!!! #######################################
# To use this PKGBUILD, you need to download the source package from http://www.segger.com. #
# Go to this webpage: "http://www.segger.com/jlink-software.html" and download              #
# "Software and documentation pack for Linux V4.98, TGZ archive xx-bit version [x,xxx kb]". #
# Place the package you downloaded together with this PKGBUILD and run "makepkg -s".        #
#############################################################################################

pkgname=j-link-software-and-documentation
pkgver=V4.98
pkgrel=1
pkgdesc="J-Link software & documentation pack for Linux"
arch=('x86_64' 'i686')
url="http://www.segger.com/jlink-software.html"
license=('custom')
depends=('glibc')
if [ "$CARCH" = "x86_64" ]; then
	md5sums=('1b85dbcd8c817b9ae5091ef2a606fc89')
	source=("JLink_Linux_${pkgver/./}_x86_64.tgz::http://xxx")
	_carch=x86_64
else
	md5sums=('08b778700f83b82c14191432f27a5894')
	source=("JLink_Linux_${pkgver/./}_i386.tgz::http://xxx")
	_carch=i386
fi

package(){
	install -d "${pkgdir}/usr/share/licenses/${pkgname}" "${pkgdir}/etc/udev/rules.d/" "${pkgdir}/usr/lib/" "${pkgdir}/usr/bin/" "${pkgdir}/usr/share/doc/${pkgname}/ReleaseNotes" "${pkgdir}/usr/share/${pkgname}/Samples/JLink/Scripts/"
	cd ${srcdir}/JLink_Linux_${pkgver/./}_${_carch}/
	install -Dm644 99-jlink.rules "${pkgdir}/etc/udev/rules.d/"
	install -Dm755 JLink* "${pkgdir}/usr/bin/"
	install -Dm644 Doc/*.pdf "${pkgdir}/usr/share/doc/${pkgname}/"
	install -Dm644 Doc/ReleaseNotes/* "${pkgdir}/usr/share/doc/${pkgname}/ReleaseNotes/"
	install -Dm644 Samples/JLink/Scripts/* "${pkgdir}/usr/share/${pkgname}/Samples/JLink/Scripts/"
	install -Dm644 Doc/License.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm755 libjlinkarm.so.4 "${pkgdir}/usr/lib/"
	cd ${pkgdir}/usr/lib/
#	ln -s libjlinkarm.so.4{,.80.8}
}
