# Contributor Dario 'Dax' Vilardi <dax@deelab.org>

pkgname=oxygenrefit2-icon-theme
pkgver=2.5.0
pkgrel=2
pkgdesc="Oxygen-Refit 2 icon theme for GNOME"
arch=('i686' 'x86_64')
makedepends=('findutils' 'imagemagick')
url="http://www.nanolx.org/nanolx/oxygenrefit2/"
license=('LGPL3')
source=(http://download.tuxfamily.org/oxygenrefit2/oxygen-refit-2-$pkgver.tar.bz2)
md5sums=('60f32f98d8d33d82db79b6bb934f0580')

build()
{
cd "$srcdir"
install -d "${pkgdir}/usr/share/icons/"
cp -rf "oxygen-refit-2-$pkgver" "${pkgdir}/usr/share/icons/" || return 1
find -type f -print0 | xargs -0 chmod 644
}
