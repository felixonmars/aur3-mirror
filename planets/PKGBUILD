#Maintainer: Robert J Bosse  <robert.bosse@hvf-bs.net>
pkgname=planets
pkgver=0.1.13
pkgrel=1
depends=('tk')
makedepends=('ocaml' 'make')
arch=('i686' 'x86_64')
license=('GPL')
pkgdesc="A program for playing with simulations of planetary systems"
url="http://planets.homedns.org/"
source=(http://planets.homedns.org/dist/${pkgname}-${pkgver}.tgz)
md5sums=('2c72f2469ee0413bd470a2ad84f2f0f8')

build(){
cd "${srcdir}/${pkgname}-${pkgver}"
make planets
install -Dm755 planets ${pkgdir}/usr/bin/planets
install -Dm644 planets.desktop ${pkgdir}/usr/share/applications/planets.desktop
install -Dm644 planets.png ${pkgdir}/usr/share/pixmaps/planets.png
install -Dm644 getting_started.html ${pkgdir}/usr/share/doc/planets/getting_started.html
}
# vim:set ts=2 sw=2 et:
