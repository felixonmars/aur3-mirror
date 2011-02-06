# Contributor: Alex <einfachnuralex> Predeschly <einfachnuralex_AT_gmx_DOT_net>
pkgname=gfuse-manager
pkgver=0.0.8b1
pkgrel=1
arch=('i686')
pkgdesc="A GTK+ based client which uses libfusi"
url="http://www.scheinwelt.at/~norbertf/devel/fusi/"
license="GPL"
depends=('glib2' 'xdg-utils' 'libglade' 'gtk2' 'gnome-keyring' 'gconf' 'libfusi')
makedepends=('gcc' 'make' 'glib2' 'xdg-utils' 'libglade' 'gtk2' 'gnome-keyring' 'gconf' 'libfusi')
provides=()
conflicts=()
replaces=()
backup=()
install=
source=(http://www.scheinwelt.at/~norbertf/devel/fusi/files/$pkgname-$pkgver.tar.gz)
md5sums=('1753e87bb2ae20088f007dff1c4ba9dd')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc
  make || return 1
  make DESTDIR=$startdir/pkg install
}
