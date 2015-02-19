# Maintainer: MrSerenity <MrSerenity@outlook.com>

pkgname=teamspeak3-i18n-fr
pkgver=3.0.13
pkgrel=2
pkgdesc="French translation for TeamSpeak3"
arch=(any)
url="http://addons.teamspeak.com/directory/category/Translations.html"
license=('GPL')
depends=(teamspeak3)
makedepends=(unzip)
source=(teamspeak3-i18n-fr_$pkgver.zip::http://addons.teamspeak.com/directory/addon/download/Traduction-Française-French-Linux-RC1.html)
md5sums=('b0ee63dbb1a6103d86119e441316d600')

package() {
	install -dm755 "$pkgdir"/opt/teamspeak3/
	cp -a translations "$pkgdir"/opt/teamspeak3/
	cp -a styles "$pkgdir"/opt/teamspeak3/
}
