# Maintainer: Kai Korla <balticer[at]balticer[dot]de>
pkgname=dschaerf-extension-temperature
pkgver=2014.04.25
pkgrel=2
pkgdesc="GNOME Shell temperature sensors extension developed by dschaerf."
url="http://ffgtk.dschaerf.de/tippstricks/gnomeshellerweiterungen/temperatur/index.php"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('gnome-shell')
optdepends=(
    'hddtemp: harddisk temperature support'
    'nvidia-utils: NVIDIA temperature support'
    'catalyst: ATI temperature support')
makedepends=()
conflicts=()
replaces=()
backup=()
install='dschaerf-extension-temperature.install'
source=("http://download.dschaerf.de/source/Temperature@dschaerf.tar.gz")
md5sums=('e437cf96b9b0bb5914a8882aa545cf51')

package() {
	cd "${srcdir}/Temperature@dschaerf"
	mkdir -p "${pkgdir}/usr/share/gnome-shell/extensions/Temperature@dschaerf"
	cp -R * "${pkgdir}/usr/share/gnome-shell/extensions/Temperature@dschaerf"
}
