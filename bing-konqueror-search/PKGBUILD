# Contributor Flamelab <panosfilip@gmail.com>

pkgname=bing-konqueror-search
pkgver=0.1
pkgrel=1
pkgdesc="Microsoft's Bing search engine for Konqueror"
arch=(any)
url="http://www.bing.com"
license=('custom')
depends=("kdebase>=4.2")
source=(bing.desktop)
md5sums=('1c9b8288d43ab5e725d64d2b05955c56')
build() {
	cd ${srcdir}
	local prefix=${pkgdir}/usr/share/kde4/services/searchproviders/
	install -Dm644 bing.desktop ${prefix}/bing.desktop
}
