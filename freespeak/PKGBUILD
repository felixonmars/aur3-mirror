# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=freespeak
pkgver=0.3.0
pkgrel=3
pkgdesc="A PyGTK GUI frontend to various online translator engines (Google, Yahoo, etc.)"
arch=('any')
url="http://$pkgname.berlios.de/"
license=('GPL')
depends=('dbus-python' 'python-lxml' 'gnome-python-extras' 'gtkspell' 'python-xlib')
makedepends=('pkgconfig>=0.9' 'intltool>=0.35')
install=$pkgname.install
source=(http://download.berlios.de/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('cabb6bb32882e067919ad8a03cb91a0e')

build() {
  cd $pkgname-$pkgver

  ./configure	--prefix=/usr \
		--with-gconf-schema-file-dir=/usr/share/gconf/schemas

  make || return 1
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
