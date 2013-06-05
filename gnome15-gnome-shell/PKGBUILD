# Maintainer: Nuno Araujo <nuno.araujo@russo79.com>
pkgname=gnome15-gnome-shell
pkgver=0.0.3
pkgrel=1
pkgdesc="Gnome Shell plugin for Gnome15"
arch=(any)
url="http://www.russo79.com/gnome15"
license=('GPL')
depends=('gnome15' 'gnome-shell')
makedepends=('binutils')
install=$pkgname.install
source=("https://projects.russo79.com/attachments/download/110/${pkgname}-${pkgver}.tar.gz")
md5sums=('7aaace30a54dfe392c067d9eb37aa082')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make install DESTDIR=${pkgdir}
}

# vim:set ts=2 sw=2 et:
