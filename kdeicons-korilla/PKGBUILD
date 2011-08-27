# Maintainer: hugo <hugoalveslobo@sapo.pt>

pkgname=kdeicons-korilla
pkgver=1.3.5
pkgrel=1
pkgdesc="Kool Gorilla Icon Set for KDE"
depends=('kdelibs' 'kdebase')
url="http://www.kde-look.org/content/show.php?content=7264"
source=(http://home.comcast.net/~gorillaonkde/gorilla/Korilla_Icons-v${pkgver}.tar.bz2) 
md5sums=('321f63fae792cdab26b98a4739d4d15d')

build() {
	mkdir -p $startdir/pkg/opt/kde/share/icons
	mv $startdir/src/Kool.Gorilla $startdir/pkg/opt/kde/share/icons
}
