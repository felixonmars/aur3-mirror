# Contributor: Bartosz Chmura <chmurli at gmail dot com>

pkgname=small-victory-gtk-theme
_pkgname=Victory*
pkgver=2010.07.15
pkgrel=3
pkgdesc="A New Compact Version of Victory (GTK theme) with a Dark Panel"
arch=('any')
url="http://gnome-look.org/content/show.php?content=124225"
license=('GPL')
depends=('gtk-engine-murrine-git')
optdepends=('nautilus-elementary: the fork of Nautilus for simplicity [AUR]'
	'moblin-icon-theme-git: the Moblin default icon theme [AUR]'
	'victory-gtk-theme: minimalistic GNOME / XFCE theme [AUR]')
source=(http://gnome-look.org/CONTENT/content-files/124225-VictorySmall20100715.tar.gz)
md5sums=('027883d0ac00cc90966057822255bcad')

build () {
	mkdir -p ${pkgdir}/usr/share/themes
	chmod -R 755 $srcdir/Victory* 
	cp -R $srcdir/${_pkgname} ${pkgdir}/usr/share/themes || return 1	
}
