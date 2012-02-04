# Contributor: Jared B. <nitro@legroom.net>

pkgname=lotus-notes-base
pkgver=8.5
pkgrel=1
_pkgnum=C1SP5EN
_pkgorig=ibm_lotus_notes
pkgdesc='Lotus Notes messaging and collaboration suite'
arch=(i686)
license=('unknown')
url='http://www.ibm.com/software/lotus/products/notes/'
install=${pkgname}.install
depends=('alsa-lib' 'atk' 'audiofile' 'avahi' 'cairo' 'libstdc++5' 'libcups' 'dbus' 'dbus-glib' 'e2fsprogs' 'eel' 'esound' 'expat' 'fontconfig' 'freetype2' 'fam' 'gcc-libs' 'gconf' 'glib2' 'glibc' 'gnome-desktop' 'gnome-keyring' 'gnome-menus' 'gnome-vfs' 'gnutls' 'gtk2' 'heimdal' 'libart-lgpl' 'libbonobo' 'libbonoboui' 'libcap' 'libgail-gnome' 'libgcrypt' 'libglade' 'libgnome' 'libgnomecanvas' 'libgnomeprint' 'libgnomeprintui' 'libgnomeui' 'libgpg-error' 'libice' 'libjpeg' 'libpng' 'libsm' 'libstdc++5' 'libx11' 'libxau' 'libxcursor' 'libxdmcp' 'libxext' 'libxfixes' 'libxft' 'libxi' 'libxinerama' 'libxml2' 'libxrandr' 'libxrender' 'libxt' 'openssl' 'orbit2' 'pam' 'pango' 'popt' 'startup-notification' 'zlib')
makedepends=('rpmextract')
source=(${_pkgnum}.tar
	${pkgname}.install)
md5sums=('19a68a6258071d58b2f14cc344a76d8a'
	'd44beff80d625ad072a47368e12068ff')

# This package must first be downloaded from IBM's Passport Advantage website:
# https://www-112.ibm.com/software/howtobuy/passportadvantage/paocustomer/passporthome.nsf/pao?OpenAgent&softdlmediaaccess

build() {
	# Unpack source packages
	cd ${pkgdir}
	rpmextract.sh ../src/${_pkgorig}-${pkgver}.i586.rpm

	# fix ownership and permissions
	chown root:root -R ${pkgdir}
}
