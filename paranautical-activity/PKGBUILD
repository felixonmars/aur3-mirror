# Contributor: Ben R <thebenj88 *AT* gmail *DOT* com>

pkgname=paranautical-activity
pkgver=1.8
pkgrel=1
pkgdesc="Rogue-like FPS similar to Quake and Doom (Humble Bundle version)"
url="http://codeavarice.com/"
arch=('i686' 'x86_64')
license=('Commercial')
depends=(glu hicolor-icon-theme libxcursor libxext)
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')
install=$pkgname.install
changelog=$pkgname.changelog
PKGEXT='.pkg.tar'
source=("hib://Paranautical_20Activity_20Beta_20V${pkgver}_20Linux.zip" "$pkgname.desktop")
sha1sums=('640f6243909c78b764053023acd75ba16b97a733'
          '9a77b9333e53d15a261c3520d5561f80b280f66f')
[[ $CARCH == x86_64 ]] && depends+=(lib32-glu lib32-libxcursor lib32-libxext)

package() {
	mkdir -p "$pkgdir/opt/$pkgname"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/icons/hicolor/128x128/apps"

	chmod +x "Linux/Paranautical Activity.x86"

	install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	cp -r 'Linux' "$pkgdir/opt/$pkgname"
	cp 'Linux/Paranautical Activity_Data/Resources/UnityPlayer.png' \
		"$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"
	ln -s "/opt/$pkgname/Linux/Paranautical Activity.x86" "$pkgdir/usr/bin/$pkgname"
}