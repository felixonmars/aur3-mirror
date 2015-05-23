# Maintainer: Michael Wendland <michael@michiwend.com>

pkgname=evopop-gtk-theme
pkgver=0.28
pkgrel=1
pkgdesc="A simple, flat and bold Gtk theme for Evolve OS & Budgie Desktop. Iris Dark was used as base."
arch=('any')
url="https://github.com/solus-project/evopop-gtk-theme"
license=('GPL3')
depends=('gtk3>=3.16')
provides=('evopop-gtk-theme', 'evopop-light-gtk-theme')
conflicts=('evopop-gtk-theme-git', 'evopop-gtk-theme')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/solus-project/evopop-gtk-theme/archive/$pkgver.tar.gz")
sha256sums=('3ec60b86f0075d19c6cb2b8d5fb704408059708d575e3bc70ebbf2101e340aea')


build() {
  cd $pkgname-$pkgver

  autoreconf -vfi
  ./configure --prefix=/usr $*
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR=${pkgdir} install
}

# vim: ts=2 sw=2 et:
