# Maintainer: Nebu Pookins <nebupookins@gmail.com>
pkgname=hurrican
pkgver=0.1.0
pkgrel=3
pkgdesc="a jump and shoot game based on the Turrican game series."
arch=('x86_64') #Problaby works on i686, but haven't tested...
url="http://hurrican-game.de/"
license=('custom')
depends=(libmodplug sdl_image sdl_mixer mesa)
changelog=ChangeLog
source=(https://github.com/NebuPookins/${pkgname}/archive/v${pkgver}.tar.gz)

build() {
	cd "$srcdir/${pkgname}-${pkgver}/Hurrican/src"
	msg "Compiling."
	make TARGET=linux
}

package() {
	msg "Installing game to /opt/$pkgname"
	install -dm755 "$pkgdir/opt/$pkgname"
	install -m755 "$srcdir/${pkgname}-${pkgver}/Hurrican/hurricanlinux" "$pkgdir/opt/$pkgname/"
	install -m644 "$srcdir/${pkgname}-${pkgver}/Hurrican/english.lng" "$pkgdir/opt/$pkgname/"
	cp -r "$srcdir/${pkgname}-${pkgver}/Hurrican/data" "$pkgdir/opt/$pkgname/data/"
	cp -r "$srcdir/${pkgname}-${pkgver}/Hurrican/lang" "$pkgdir/opt/$pkgname/lang/"
	msg "Installing LICENSE file in /usr/share/licenses/$pkgname/LICENSE"
	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	install -D -m644 "$srcdir/${pkgname}-${pkgver}/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	msg "Installing run script in /usr/bin"
	mkdir -p "$pkgdir/usr/bin/"
	echo "cd /opt/$pkgname/" > "$pkgdir/usr/bin/${pkgname}"
	echo "./hurricanlinux \$@"  >> "$pkgdir/usr/bin/${pkgname}"
	chmod 755 "$pkgdir/usr/bin/${pkgname}"
	msg "Converting icon from .ico to .png"
	msg "Installing icon in /usr/share/pixmaps/${pkgname}/"
	install -dm755 "$pkgdir/usr/share/pixmaps/${pkgname}/"
	convert "$srcdir/${pkgname}-${pkgver}/Hurrican/Hurrican.ico" "$pkgdir/usr/share/pixmaps/${pkgname}/hurrican.png"
	chmod 644 "$pkgdir/usr/share/pixmaps/${pkgname}/hurrican-0.png"
	chmod 644 "$pkgdir/usr/share/pixmaps/${pkgname}/hurrican-1.png"
	chmod 644 "$pkgdir/usr/share/pixmaps/${pkgname}/hurrican-2.png"
	chmod 644 "$pkgdir/usr/share/pixmaps/${pkgname}/hurrican-3.png"
	chmod 644 "$pkgdir/usr/share/pixmaps/${pkgname}/hurrican-4.png"
	chmod 644 "$pkgdir/usr/share/pixmaps/${pkgname}/hurrican-5.png"
	chmod 644 "$pkgdir/usr/share/pixmaps/${pkgname}/hurrican-6.png"
	msg "Installing desktop file in /usr/share/applications/${pkgname}.desktop"
	mkdir -p "$pkgdir/usr/share/applications/"
	echo "[Desktop Entry]" > "$pkgdir/usr/share/applications/${pkgname}.desktop"
	echo "Type=Application" >> "$pkgdir/usr/share/applications/${pkgname}.desktop"
	echo "Version=1.0" >> "$pkgdir/usr/share/applications/${pkgname}.desktop"
	echo "Name=Hurrican" >> "$pkgdir/usr/share/applications/${pkgname}.desktop"
	echo "Comment=a jump and shoot game based on the Turrican game series." >> "$pkgdir/usr/share/applications/${pkgname}.desktop"
	echo "Exec=hurrican" >> "$pkgdir/usr/share/applications/${pkgname}.desktop"
	echo "Icon=/usr/share/pixmaps/${pkgname}/${pkgname}-2.png" >> "$pkgdir/usr/share/applications/${pkgname}.desktop"
	echo "Terminal=false" >> "$pkgdir/usr/share/applications/${pkgname}.desktop"
	echo "StartupNotify=false" >> "$pkgdir/usr/share/applications/${pkgname}.desktop"
	echo "Categories=Game;ActionGame;ArcadeGame;" >> "$pkgdir/usr/share/applications/${pkgname}.desktop"
	chmod 644 "$pkgdir/usr/share/applications/${pkgname}.desktop"
}

md5sums=('4288a47860365e036b92b31c5e307de1')
sha1sums=('90442ebf194f0aa7f83b3cb75b03cd5bb13d372f')
sha256sums=('535520cc01b23e0d7d95f28c19d75c443a5755420d053ae52b4106ef0a03c4bd')
sha384sums=('1acdbddc873c46c8df3a4608b23aacc72ef945ad5ffb5d625a4d07bc4b5b767a7db3b8321fe2168ed43825830b23cde5')
sha512sums=('6ecc8733811a7ddaee2ceed60e489361a5335049ae60b87765167c880c1ab57d541ac6ed8a79b382d9dd3c3dcc6b4d74e2969b5e5e7af43d6edd359930a74179')
