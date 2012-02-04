# Contributor: antzek9 <antze.k9 at googlemail dot com>
# Maintainer: antzek9
pkgname=evolution-tray
pkgver=0.0.8
pkgrel=3
pkgdesc="This plugin is useful when you want to put evolution in "tray" (notification area)."
arch=(i686 x86_64)
url="http://gnome.eu.org/evo/index.php/Evolution_Tray"
license=('GPL')
groups=('office')
depends=('evolution>=2.30' 'libgnomeui' 'gconf' 'libnotify')
makedepends=('intltool>=0.25')
provides=('evolution-tray')
conflicts=('evolution-tray-git')
replaces=()
backup=()
options=()
install=
source=("http://gnome.eu.org/evolution-tray-$pkgver.tar.gz")
noextract=()
md5sums=('087d0c6e909530232259b9ae1be9e17d')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir" install
}

