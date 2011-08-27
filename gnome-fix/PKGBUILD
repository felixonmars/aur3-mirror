#Script by Superandrex

pkgname=gnome-fix
pkgver=0
pkgrel=1
pkgdesc="A Simple Script For Resolve Cursor Problem of Gnome 2.30 and Change Gnome Default Bg (Lock Screen Bg)"
arch=('i686' 'x86_64')
url="http://superandrex.altervista.org/aur-packages/"
license=('GPL')
depends=('gnome-desktop>=2.30')
makedepends=()
options=()
provides=()
conflicts=()
groups=('script')
source=(http://superandrex.altervista.org/archivio/aur/gnome-fix.${pkgver}-${pkgrel}.tar.gz)
md5sums=('edd8e70ed14352560d3ce3cfb00704a0')

build() {
	install -d ${pkgdir}/usr/share/gnome-fix/
install -d ${pkgdir}/usr/bin/
cp gnome-fix ${pkgdir}/usr/bin/
cp gnome-fix-help ${pkgdir}/usr/share/gnome-fix/
}
