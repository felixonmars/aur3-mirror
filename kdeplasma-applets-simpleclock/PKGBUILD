# Maintainer: Vinycius Maia <suportevg@uol.com.br>

pkgname=kdeplasma-applets-simpleclock
pkgver=0.2
pkgrel=2
pkgdesc="A very simple clock applet for KDE"
arch=('any')
url="http://kde-apps.org/content/show.php?content=142938"
license=('GPL')
depends=('kdebase-workspace>=4.7')
source=(http://kde-apps.org/CONTENT/content-files/142938-SimpleClock.plasmoid)
md5sums=('9b8a5b3b96be0501362a3740add54a62')

package() {
	cd "$pkgdir"
	
	install -dm755 "usr/share/apps/plasma/plasmoids/simpleclock"
	
	cp -R "${srcdir}/"{contents,metadata.desktop} \
	      "usr/share/apps/plasma/plasmoids/simpleclock"
	
	install -Dm644 "${srcdir}/"metadata.desktop \
	      "usr/share/kde4/services/plasma-applet-simpleclock.desktop"

	find . -name .*~ -type f -exec rm {} \;
}
