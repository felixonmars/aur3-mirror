# Maintainer: Gadget3000 <gadget3000 at msn dot com>
# Contributor: Jiri Prochazka <Pro.J@seznam.cz>

pkgname=gtodo
pkgver=0.16.0
pkgrel=4
pkgdesc="A gtk2 todo list manager"
arch=(i686 x86_64)
license=('GPL')
url="http://blog.sarine.nl/gtodo-2/"
depends=('gnome-vfs>=2.18.1' 'libxslt' 'gtk2')
makedepends=('pkgconfig' 'perl-xml-parser')
source=(http://download.sarine.nl/gtodo/gtodo-${pkgver}-rc2.tar.gz)
md5sums=('ed3cbf99269789cc34bced0fcfe074e1')
install=gtodo.install

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=$pkgdir install

#  mkdir -p $pkgdir/usr/share/gconf/schemas
#  gconf-merge-schema $pkgdir/usr/share/gconf/schemas/${pkgname}.schemas $pkgdir/etc/gconf/schemas/*.schemas
#  rm -f $pkgdir/etc/gconf/schemas/*.schemas
}
