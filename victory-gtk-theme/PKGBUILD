# Maintainer: Bartosz Chmura <chmurli at gmail dot com>

pkgname=victory-gtk-theme
_pkgname=Victory*
pkgver=2012.03.16
pkgrel=2
pkgdesc="minimalistic GNOME 2/3 (Shell), Mate (Cinnamon) and XFCE theme"
arch=('any')
url="http://gnome-look.org/content/show.php/Victory+%28Strikes+Again%29?content=123936"
license=('GPL')
depends=('gtk-engine-murrine')
source=('http://gnome-look.org/CONTENT/content-files/123936-Victory20120316b.tar.gz')
sha256sums=('6cd91f1550204c1324dfd6c958b4db76d751528222f69dadd7ffedde74490c44')
#install=victory-gtk-theme.install

build () {
	install -d -m 755 ${pkgdir}/usr/share/themes || return 1	
	chmod -R 755 $srcdir/${_pkgname} || return 1
	cp -R $srcdir/${_pkgname} ${pkgdir}/usr/share/themes || return 1	
}
