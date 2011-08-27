# Contributor: Samed Beyribey <ras0ir AT eventualis DOT org>
pkgname=sud-icon-theme
pkgver=1.3
pkgrel=1
pkgdesc="SudUbuntu Icon Theme"
arch=('i686' 'x86_64')
url="http://www.gnome-look.org/content/show.php/SudUbuntu+?content=93010"
license=('GPL')
source=(http://cine9.free.fr/icones/Sud.tar.gz)
md5sums=('1d06e7a36b8f36cdd059e065c0694940')

build() {
  install -d -m755 $pkgdir/usr/share/icons
  cp -r $srcdir/Sud $pkgdir/usr/share/icons
}
