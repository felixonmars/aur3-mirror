# Maintainer: doorknob60 <doorknob60 at gmail dot com>

pkgname=openoffice-dark-gtk-fix
pkgver=1.1
pkgrel=3
pkgdesc="This fixes OpenOffice.org's (and Libreoffice's) appearance and behavior in dark GTK themes"
arch=(i686 x86_64)
url="http://www.rebelzero.com/fixes/openofficeorg-dark-theme-workaround-with-ubuntu-804"
install=${pkgname}.install
license=('gpl')
groups=('office')
depends=('gtk-engines')
source=(openoffice-dark-gtk-fix.sh)
md5sums=('d5029da2ffd9dae510f358c4f97f901e')

build() {
install -d $pkgdir/usr/bin
install -D openoffice-dark-gtk-fix.sh $pkgdir/usr/bin/
chmod 755 $pkgdir/usr/bin/openoffice-dark-gtk-fix.sh
}
