# Maintainer: Kao Dome <kaodome .:at:. gmail .:dot:. com> 

pkgname=gtk-themes-finery
pkgver=0.1.4
pkgrel=1
pkgdesc="Finery and Finery Dark themes, an implementation of fibermarupok's mockup."
arch=('any')
url='http://gnome-look.org/content/show.php/Finery+(improved+Radiance+theme)?content=124694'
license=('GPL')
depends=('gtk-engine-murrine-git')
optdepends=('ubuntu-mono: suggested icon themes.')
source=(http://gnome-look.org/CONTENT/content-files/124694-FineryThemes-$pkgver.tar.gz)
sha1sums=('6f1f5136cf3aaf8b1a3d0fa2727f15134be9b654')
_destdir=$pkgdir/usr/share/themes

build() {
    cd ${srcdir}/finery-themes_$pkgver
	 mkdir -p $_destdir
	 cp -r * $_destdir
}
