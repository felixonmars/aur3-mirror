# Contributor: benoror <benoror@gmail.com>

pkgname=elementary-mod-gtk-theme
_pkgname=elementary-mod
pkgver=0.3
pkgrel=1
pkgdesc="Modified Elementary Theme for nautilus-elementary only."
arch=('i686' 'x86_64')
url="http://gnome-look.org/content/show.php?content=119715"
license=('GPL2')
depends=('gtk-engine-murrine' 'gtk-aurora-engine' 'nautilus-elementary')
optdepends=('elementary-icons')
source=(http://gnome-look.org/CONTENT/content-files/119715-elementary-mod.tar.gz)
md5sums=('242ea64904a754ac2e7d404015b25a7e')

build () {
	mkdir -p ${pkgdir}/usr/share/themes
	cp -R $srcdir/${_pkgname} ${pkgdir}/usr/share/themes/${_pkgname}/ || return 1
}
