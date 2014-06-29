# Maintainer: Kai Korla <balticer[at]balticer[dot]de>
pkgname=dschaerf-extension-weather
pkgver=2014.04.25
pkgrel=1
pkgdesc="GNOME Shell weather extension developed by dschaerf."
url="http://ffgtk.dschaerf.de/tippstricks/gnomeshellerweiterungen/wetter/index.php"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('gnome-shell')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install='dschaerf-extension-weather.install'
source=("http://download.dschaerf.de/source/Weather@dschaerf.tar.gz")
md5sums=('5d0e31d724cb615ccb29f1952b3739aa')

package() {
	cd "${srcdir}/Weather@dschaerf"
	mkdir -p "${pkgdir}/usr/share/gnome-shell/extensions/Weather@dschaerf"
	cp -R * "${pkgdir}/usr/share/gnome-shell/extensions/Weather@dschaerf"
}
