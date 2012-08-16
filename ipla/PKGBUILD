# Contributor: Tom Wizetek <tom@wizetek.com>
pkgname=ipla
pkgver=1.1beta
pkgrel=6
pkgdesc="Interaktywna platforma multimedialna (PL)"
url="http://www.ipla.pl/"
license=('custom')
arch=('i686' 'x86_64')
depends=('adobe-air')
makedepends=('unzip')
[[ ${CARCH} = 'i686' ]] && optdepends=('gnome-keyring' 'kdeutils-kwallet')
[[ ${CARCH} = 'x86_64' ]] && optdepends=('gcc-libs-multilib' 'binutils-multilib' 'gcc-multilib' 'lib32-libxtst' 'lib32-libxslt' 'lib32-libgnome-keyring' 'gnome-keyring' 'kdeutils-kwallet')
source=('http://ipla.tv/templates/iplatv/download/iplalite.air')
md5sums=('28b1b697843933b5add28b72b0c9cf3b')
noextract=('iplalite.air')

package() {
	_appver="1.1 Beta"
        _appverpath="META-INF/AIR/application.xml"

        unzip -q -u iplalite.air

        if [[ -z $(grep ">$_appver<" "$_appverpath") ]]
	then
	        _airver=$(sed -n 's,[ \t]*</*version>,,gp' "$_appverpath")
		msg ""
		msg "VERSION MISMATCH!"
	        msg "Expected application version: $_appver"
	        msg "Current .air file version: $_airver"
		echo -en "\nThis may not work. Continue anyway? [Y/n]"

		until [[ ${_contyesno} == 'y' ]]
		do
			read -sn1 _contyesno
			case ${_contyesno} in
				y|Y|'') echo && _contyesno='y' ;;
				n|N|'') echo && return 1 ;;
			esac
		done
	fi

	install -D -m 644 "$srcdir/iplalite.air" "$pkgdir/opt/ipla/iplalite.air"
        install -D -m 644 "$srcdir/style/assets/LogoSmall.png" "$pkgdir/usr/share/pixmaps/ipla/ipla_small.png"
        install -D -m 644 "$srcdir/style/assets/logo16_16.png" "$pkgdir/usr/share/pixmaps/ipla/ipla_16x16.png"
        install -D -m 644 "$srcdir/style/assets/logo32_32.png" "$pkgdir/usr/share/pixmaps/ipla/ipla_32x32.png"
        install -D -m 644 "$srcdir/style/assets/logo48_48.png" "$pkgdir/usr/share/pixmaps/ipla/ipla_48x48.png"
        install -D -m 644 "$srcdir/style/assets/logo128_128.png" "$pkgdir/usr/share/pixmaps/ipla/ipla_128x128.png"

	cat > ipla-gnome << EoF
#!/bin/sh
GNOME_DESKTOP_SESSION_ID=1 adobe-air /opt/ipla/iplalite.air
EoF
	install -D -m 755 "$srcdir/ipla-gnome" "$pkgdir/usr/bin/ipla-gnome"

	cat > ipla-kde << EoF
#!/bin/sh
KDE_FULL_SESSION=true adobe-air /opt/ipla/iplalite.air
EoF
	install -D -m 755 "$srcdir/ipla-kde" "$pkgdir/usr/bin/ipla-kde"

	cat > ipla-gnome.desktop << EoF
[Desktop Entry]
Type=Application
Terminal=false
Categories=Application;Network;
Exec=/usr/bin/ipla-gnome
Icon=/usr/share/pixmaps/ipla/ipla_128x128.png
Name=ipla (GNOME)
Comment=Interaktywna platforma multimedialna
EoF
	install -D -m 644 "$srcdir/ipla-gnome.desktop" "$pkgdir/usr/share/applications/ipla-gnome.desktop"

	cat > ipla-kde.desktop << EoF
[Desktop Entry]
Type=Application
Terminal=false
Categories=Application;Network;
Exec=/usr/bin/ipla-kde
Icon=/usr/share/pixmaps/ipla/ipla_128x128.png
Name=ipla (KDE)
Comment=Interaktywna platforma multimedialna
EoF
	install -D -m 644 "$srcdir/ipla-kde.desktop" "$pkgdir/usr/share/applications/ipla-kde.desktop"

	msg ""
	msg "ipla requires a password management tool."
	msg "Install one for the desktop environment of your choice."
	msg 'See "Optional dependencies" during package installation.'
	msg ""
	msg 'You may also need to install from AUR "libpng12" (i686) or "lib32-libpng12" (x86_64)'
	msg 'for Adobe AIR to work properly instead of using "libpng" 1.4 or newer.'
	msg ""
}
