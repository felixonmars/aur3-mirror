# Maintainer: Aliasbody <aliasbody@gmail.com>
pkgname=javafx-sdk
pkgver=2.2b19
pkgrel=1
pkgdesc="A lightweight, hardware-accelerated Java UI platform for enterprise business applications"
url="http://javafx.com/"
arch=("x86_64" "i686")
license=("custom: Oracle Technology Network")
depends=("java-runtime" "ffmpeg" "gtk2")
install=javafx-sdk.install
if [ $CARCH == "i686" ]; then
	source=("https://dl.dropbox.com/s/d987vk1le7l84cl/javafx_sdk-2_2_0-beta-b19-linux-i586.zip")
	md5sums=("4963d442cc253f642ccce407969d2784")
fi

if [ $CARCH == "x86_64" ]; then
	source=("https://dl.dropbox.com/s/vlljp3hlibp7pq3/javafx_sdk-2_2_0-beta-b19-linux-x64.zip")
	md5sums=("41163b2add9c5e830ee0a323b93e7237")
fi

package() {
	# Move all the files from the package into the /usr/lib/jvm/javafx-sdk folder
	mkdir -p "${pkgdir}/usr/lib/jvm/${pkgname}"
	mv "${srcdir}/javafx-sdk2.2.0-beta/"* "${pkgdir}/usr/lib/jvm/${pkgname}/"
	
	# Make a copy of the licences into the /usr/share/licences/javafx-sdk folder
	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	mv "${pkgdir}/usr/lib/jvm/$pkgname/"{THIRDPARTYLICENSEREADME.txt,COPYRIGHT.html} "${pkgdir}/usr/share/licenses/${pkgname}"
	
	# Adding man page
	mv "${pkgdir}/usr/lib/jvm/${pkgname}/man/"{ja_JP.UTF-8,ja_JP}
	gzip -9 "${pkgdir}/usr/lib/jvm/${pkgname}/man/"{ja_JP/man1,man1}/javafxpackager.1
	mv "${pkgdir}/usr/lib/jvm/${pkgname}/man" "${pkgdir}/usr/share/man"
	
	# Create a symlink of the javafxpackager binary and send it to the /usr/bin folder
	mkdir -p "${pkgdir}/usr/bin"
	chmod +x "${pkgdir}/usr/lib/jvm/${pkgname}/bin/javafxpackager"
	ln -s "/usr/lib/jvm/${pkgname}/bin/javafxpackager" "${pkgdir}/usr/bin/javafxpackager"
}
