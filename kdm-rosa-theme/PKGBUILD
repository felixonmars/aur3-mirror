pkgname=kdm-rosa-theme
_pkgname=kdm-rosa-theme
pkgver=1.2
pkgrel=1
pkgdesc="Kdm theme from Rosa Desktop 2012, requires patched kdebase-workspace"
arch=('i686' 'x86_64')
url='http://www.rosalab.ru/'
license=('GPL' 'LGPL' 'FDL')
# note on libxdamage:
# 	not detected by namcap because libgl depends on it
#	but nvidia providing libgl does not depend on libxdamage
depends=('kdebase-workspace-appmenu-rosa')
provides=('kdm-rosa-theme')
source=("http://mirror.yandex.ru/rosa/rosa2012.1/repository/x86_64/main/release/mandriva-kde4-config-common-2012-22-rosa2012.1.noarch.rpm"
	"http://mirror.yandex.ru/rosa/rosa2012.1/repository/x86_64/main/release/mandriva-theme-Rosa-1.4.9-31-rosa2012.1.noarch.rpm"
	"http://mirror.yandex.ru/rosa/rosa2012lts/repository/x86_64/main/release/kdm-4.8.2-5-rosa.lts2012.0.x86_64.rpm")
sha1sums=('d968cc1f7ab2e52b157d2eb509a93ab01d88e9ad'
	  'db588194564fd651cf2ab7c83e95c942fbca07b4'
	  'a1d9c5b85ec6fb0154b1991e2afef1269e53b10b')

build() {
	cd ..
	mkdir -p pkg/usr/share/apps/kdm/themes/
	cp -R src/usr/share/apps/kdm/themes/mandriva-kde4 pkg/usr/share/apps/kdm/themes/
	cp -R src/usr/share/mdk pkg/usr/share/
	cp -R src/usr/share/apps/kdm/pics/ pkg/usr/share/apps/kdm/
}
