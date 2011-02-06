# Contributor: Václav Kramář <vaclav.kramar@tiscali.cz>

pkgname=gtk-theme-murrina-redmond
pkgver=1.1
pkgrel=3
pkgdesc="Windows 95/98/2000 inspirated GTK2 and Metacity theme"
arch=('i686' 'x86_64')
url="http://xfce-look.org/content/show.php/Murrina+Redmond?content=95262"
license=('GPL')
depends=('gtk-engine-murrine')
optdepends=('metacity')
source=(http://xfce-look.org/CONTENT/content-files/95262-Murrina%20Redmond%201.1.tar.gz)
md5sums=('94db89fb5d1c88b29d7e6da959f278d0')

build() {
  install -d ${pkgdir}/usr/share/themes || return 1
  cp -r ${srcdir}/Murrina\ Redmond ${pkgdir}/usr/share/themes || return 1
}
