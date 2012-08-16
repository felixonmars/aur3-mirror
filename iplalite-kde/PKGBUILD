# Maintainer: Tomasz "Ludvick" Niedzielski <ludvick0@gmail.com>

pkgname=iplalite-kde
pkgver=1.0
pkgrel=0
pkgdesc="Polska platforma multimedialna"
url="http://www.ipla.pl/"
license=('custom')
arch=('x86_64')
depends=('adobe-air-sdk' 'gcc-libs-multilib' 'binutils-multilib' 'gcc-multilib' 'lib32-libxslt' 'lib32-libxt' 'kdeutils-kwallet')
makedepends=('unzip')
source=('http://ipla.tv/templates/iplatv/download/iplalite.air')
md5sums=('28b1b697843933b5add28b72b0c9cf3b')
noextract=('iplalite.air')

package() {
        unzip -q -u iplalite.air

        install -D -m 644 "$srcdir/style/assets/logo16_16.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/iplalite.png"
        install -D -m 644 "$srcdir/style/assets/logo32_32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/iplalite.png"
        install -D -m 644 "$srcdir/style/assets/logo48_48.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/iplalite.png"
        install -D -m 644 "$srcdir/style/assets/logo128_128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/iplalite.png"

	cat > iplalite.desktop << EoF
[Desktop Entry]
Name=iplalite
Comment=polska platforma multimedialna
GenericName=iplalite
Exec=/opt/adobe-air-sdk/bin/adl -nodebug /opt/iplalite/META-INF/AIR/application.xml /opt/iplalite/
Type=Application
Categories=AudioVideo;
Terminal=false
Icon=iplalite
StartupNotify=true
X-KDE-StartupNotify=true
X-AppInstall-Package=iplalite
X-AppInstall-Section=main
EoF
	install -D -m 644 "$srcdir/iplalite.desktop" "$pkgdir/usr/share/applications/iplalite.desktop"

	# copy rest of files to /opt/iplalite

	install -D -m 644 "$srcdir/Away3D.swf" "$pkgdir/opt/iplalite/Away3D.swf"
	install -D -m 644 "$srcdir/ipla.swf" "$pkgdir/opt/iplalite/ipla.swf"
	install -D -m 644 "$srcdir/mimetype" "$pkgdir/opt/iplalite/mimetype"
	install -D -m 644 "$srcdir/SebCoverFlow.swf" "$pkgdir/opt/iplalite/SebCoverFlow.swf"

	install -D -m 644 "$srcdir/META-INF/signatures.xml" "$pkgdir/opt/iplalite/META-INF/signatures.xml"

	install -D -m 644 "$srcdir/META-INF/AIR/application.xml" "$pkgdir/opt/iplalite/META-INF/AIR/application.xml"
	install -D -m 644 "$srcdir/META-INF/AIR/hash" "$pkgdir/opt/iplalite/META-INF/AIR/hash"

	install -D -m 644 "$srcdir/style/assets/logo128_128.png" "$pkgdir/opt/iplalite/style/assets/logo128_128.png"
        install -D -m 644 "$srcdir/style/assets/logo16_16.png" "$pkgdir/opt/iplalite/style/assets/logo16_16.png"
        install -D -m 644 "$srcdir/style/assets/logo32_32.png" "$pkgdir/opt/iplalite/style/assets/logo32_32.png"
        install -D -m 644 "$srcdir/style/assets/logo48_48.png" "$pkgdir/opt/iplalite/style/assets/logo48_48.png"
        install -D -m 644 "$srcdir/style/assets/LogoSmall.png" "$pkgdir/opt/iplalite/style/assets/LogoSmall.png"
        install -D -m 644 "$srcdir/style/assets/ThumbnailHighlight.png" "$pkgdir/opt/iplalite/style/assets/ThumbnailHighlight.png"

#	msg ""
#	msg "ipla requires a password management tool."
#	msg "Install one for the desktop environment of your choice."
#	msg 'See "Optional dependencies" during package installation.'
#	msg ""
#	msg 'You may also need to install from AUR "libpng12" (i686) or "lib32-libpng12" (x86_64)'
#	msg 'for Adobe AIR to work properly instead of using "libpng" 1.4 or newer.'
#	msg ""
}
