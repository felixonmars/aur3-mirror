# Contributor: Jiri Prochazka <Pro.J@seznam.cz>
# Contributor: Laurie Clark-Michalek <bluepeppers@archlinux.us>

pkgname=gtodo2
pkgver=0.19.0
pkgrel=1
pkgdesc="A gtk2 todo list manager"
arch=('i686' 'x86_64')
license=('GPL')
url="http://download.sarine.nl/download/gtodo/"
depends=('gnome-vfs>=2.18.1' 'libxslt')
makedepends=()
source=(http://download.sarine.nl/$pkgname/$pkgname-$pkgver-beta.tar.gz)
md5sums=('c8e031b4926896e21a91b37c24c03caa')
install=

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=$pkgdir install

  mkdir -p ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas ${startdir}/pkg/etc/gconf/schemas/*.schemas
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas
}
