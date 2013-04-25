# Maintainer: Benjamin Bukowski <benjamin dot bukowski at gmail dot com
# Contributor: Shanto <shanto at hotmail>
# Contributor: Jesus Jerez <jhuss@archlinux.org.ve>

pkgname=eclipse-platform38
pkgver=3.8.2
_pkgbuild=201301310800
pkgrel=1
pkgdesc="Eclipse Platform 3.8 without plug-ins and SDK (a minimal installation suitable for complete per-user customization with the built-in Eclipse package manager)"
url="http://www.eclipse.org"
arch=('i686' 'x86_64')
license=('EPL/1.1')
depends=('java-runtime' 'gtk2' 'unzip' 'libwebkit' 'libxtst' 'hicolor-icon-theme')
optdepends=()
conflicts=('eclipse')
provides=("eclipse=$pkgver")
install=eclipse-platform.install
options=(!strip)

source=(
	"http://www.eclipse.org/downloads/download.php?r=1&file=/eclipse/downloads/drops/R-${pkgver}-${_pkgbuild}/eclipse-platform-${pkgver}-linux-gtk.tar.gz"
	"eclipse.sh"
	"eclipse.svg"
	"eclipse.desktop"
	"eclipse.ini.patch"
)

md5sums=('dc2ff83cef35a8082e7f631546af6a0e'
         '8dbd219db72d2c913f2e086f19a65770'
				 'a0f93d5e697837d75911f5af9a386f19'
			 	 '73c5c6ad00c72888080ff3cde413942f'
			   '3038cf6de788617aca33f94492c07dc1')


if [ "$CARCH" = "x86_64" ]; then
	source[0]=${source/linux-gtk/linux-gtk-x86_64}
	md5sums[0]='65a5e34755d6221478a77df195456d31'
fi

package() {
	cd "${srcdir}/eclipse"
	
	patch -Np1 -i "${srcdir}/eclipse.ini.patch"
	
	install -d ${pkgdir}/usr/bin ${pkgdir}/usr/lib ${pkgdir}/usr/share/applications ${pkgdir}/usr/share/icons/hicolor/{16x16,32x32,48x48}/apps
	
	install -m755 "${srcdir}/eclipse.sh" "${pkgdir}/usr/bin/eclipse"
	install -m644 "${srcdir}/eclipse.desktop" "${pkgdir}/usr/share/applications/"
	mv "${srcdir}/eclipse" "${pkgdir}/usr/share/"
	
	ln -s /usr/share/eclipse/plugins/org.eclipse.platform_${pkgver}.v${_pkgbuild}/eclipse.png "${pkgdir}/usr/share/icons/hicolor/16x16/apps/eclipse.png"
	ln -s /usr/share/eclipse/plugins/org.eclipse.platform_${pkgver}.v${_pkgbuild}/eclipse32.png "${pkgdir}/usr/share/icons/hicolor/32x32/apps/eclipse.png"
	ln -s /usr/share/eclipse/plugins/org.eclipse.platform_${pkgver}.v${_pkgbuild}/eclipse48.png "${pkgdir}/usr/share/icons/hicolor/48x48/apps/eclipse.png"
	
	install -Dm644 ${srcdir}/eclipse.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/eclipse.svg
}
