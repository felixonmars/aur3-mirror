# Maintainer: Shanto <shanto at hotmail>
# Contributor: Jesus Jerez <jhuss@archlinux.org.ve>

pkgname=eclipse-platform-indigo
_pkgname=eclipse-platform
pkgver=3.7RC1
_pkgbuild=201105122000
_pkgtype=S
pkgrel=1
pkgdesc="Eclipse Platform (Indigo) without plug-ins and SDK"
url="http://www.eclipse.org"
arch=('i686' 'x86_64')
license=('EPL')
depends=('java-environment>=6' 'gtk2>=2.20' 'libwebkit')
conflicts=('eclipse')
provides=('eclipse=3.7')
install=$_pkgname.install
changelog=$_pkgname.changelog

source=(
	"http://www.eclipse.org/downloads/download.php?r=1&file=/eclipse/downloads/drops/${_pkgtype}-${pkgver}-${_pkgbuild}/eclipse-platform-${pkgver}-linux-gtk-x86_64.tar.gz"
	"eclipse.sh"
	"eclipse.svg"
	"eclipse.desktop"
	"eclipse.ini.patch"
)

md5sums=(
	'4195376d99b73c44d09521de72cf5f54'
        '8dbd219db72d2c913f2e086f19a65770'
        'f083188c833ba05a3ce8c6b16a290c12'
	'73c5c6ad00c72888080ff3cde413942f'
	'3038cf6de788617aca33f94492c07dc1'
)

if [ "$CARCH" != "x86_64" ]; then
	source[0]="http://www.eclipse.org/downloads/download.php?r=1&file=/eclipse/downloads/drops/${_pkgtype}-${pkgver}-${_pkgbuild}/eclipse-platform-${pkgver}-linux-gtk.tar.gz"
	md5sums[0]='182c3288a6ba6e6262f557a98d61f5c9'
fi

build() {
	cd "${srcdir}/eclipse"
	
	patch -Np1 -i "${srcdir}/eclipse.ini.patch"
	
	install -d ${pkgdir}/usr/bin ${pkgdir}/usr/lib ${pkgdir}/usr/share/applications ${pkgdir}/usr/share/icons/hicolor/{16x16,32x32,48x48,scalable}/apps
	
	install -m755 "${srcdir}/eclipse.sh" "${pkgdir}/usr/bin/eclipse"
	install -m644 "${srcdir}/eclipse.desktop" "${pkgdir}/usr/share/applications/"
	mv "${srcdir}/eclipse" "${pkgdir}/usr/share/"
	
	ln -s /usr/share/eclipse/plugins/org.eclipse.platform_${pkgver}.v${_pkgbuild}/eclipse.png "${pkgdir}/usr/share/icons/hicolor/16x16/apps/eclipse.png"
	ln -s /usr/share/eclipse/plugins/org.eclipse.platform_${pkgver}.v${_pkgbuild}/eclipse32.png "${pkgdir}/usr/share/icons/hicolor/32x32/apps/eclipse.png"
	ln -s /usr/share/eclipse/plugins/org.eclipse.platform_${pkgver}.v${_pkgbuild}/eclipse48.png "${pkgdir}/usr/share/icons/hicolor/48x48/apps/eclipse.png"
	install -Dm644 ${srcdir}/eclipse.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/eclipse.svg
	
	ln -s /usr/lib/libwebkitgtk-1.0.so ${pkgdir}/usr/lib/libwebkit-1.0.so.2
}
