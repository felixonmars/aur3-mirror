# Contributor: mptpalach <mptpalach@yandex.ru>

pkgname=gnome-mud
pkgver=0.11.2
pkgrel=3
pkgdesc="MUD client for linux"
arch=('i686' 'x86_64')
url="https://wiki.gnome.org/Apps/GnomeMud"
license=('GPL2')
depends=('vte' 'libglade' 'gnet' 'gconf')
makedepends=('intltool')
source=("http://ftp.gnome.org/pub/GNOME/sources/gnome-mud/0.11/${pkgname}-${pkgver}.tar.gz")
md5sums=('aa41b2afb55158e7a9d2e14831223949')


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir/" install
}
