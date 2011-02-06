# Contributor: q0tsa <34tsp4m@gmail.com> 

pkgname=mpd_control
pkgver=0.1
pkgrel=1
pkgdesc="control mpd with dmenu"
arch=('i686' 'x86_64')
url="http://github.com/bubbl3gum/mpd_control"
license=('GPL')
depends=('mpc' 'dmenu')
source=(mpd_control)
md5sums=('b157e1fcc9dd37b0f34df6eca825bdd1')

build() {
	install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
