# Maintainer: Lukasz Fidosz <virhilo@gmail.com>

pkgname=gartoon
pkgver=1.3
pkgrel=2
license="DSL"
arch=(i686 x86_64)
pkgdesc="Gartoon is a fun looking icon pack for KDE"
depends=('kdelibs' 'kdebase')
url="http://www.kde-look.org/content/show.php?content=17362"
source=(http://www.nasland.nu/gartoon/ICONS-Gartoon-PNG-v$pkgver.tar.bz2)
md5sums=('90ddfb75d023ffb1887c824f510c21b8')

build() {
	mkdir -p $startdir/pkg/opt/kde/share/icons
	mv $startdir/src/Gartoon-PNG $startdir/pkg/opt/kde/share/icons
}
