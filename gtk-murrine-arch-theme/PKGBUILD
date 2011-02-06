# Contributor: Kristaps Esterlins <esterlinsh@gmail.com>
# Contributor: Alessio Biancalana <dottorblaster@gmail.com>

pkgname=gtk-murrine-arch-theme
_pkgname=Arch*
pkgver=0.4
pkgrel=2
pkgdesc="Arch dedicated GTK theme for Murrine engine"
arch=('i686' 'x86_64')
url="http://gnome-look.org/content/show.php/Murrine+Arch?content=96308"
license=('GPL')
depends=('gtk-engine-murrine')
source=(http://gnome-look.org/CONTENT/content-files/96308-murrine-arch-gtk-${pkgver}.tar.gz)
md5sums=('b0f13203f1769817becc2aa0a7fa9525')
build () {
	mkdir -p ${pkgdir}/usr/share/themes
	cp -R $srcdir/${_pkgname} ${pkgdir}/usr/share/themes || return 1
}
