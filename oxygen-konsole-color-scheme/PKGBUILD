# Contributor: Héctor Acosta <hector.acosta@gmail.com>
pkgname=oxygen-konsole-color-scheme
pkgver=1.0
pkgrel=1
pkgdesc="An oxygen konsole color scheme"
arch=('any')
url="http://kde-look.org/content/show.php?content=86353"
license=('LGPL')
depends=('kdebase-konsole')
source=(http://kde-look.org/CONTENT/content-files/86353-Oxygen.colorscheme)

build() {
	mkdir -p ${pkgdir}/usr/share/apps/konsole/
	cp -r ${srcdir}/86353-Oxygen.colorscheme ${pkgdir}/usr/share/apps/konsole/
}
md5sums=('0f3713635b21880b6c822bd9098cf037')
