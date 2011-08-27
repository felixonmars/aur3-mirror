# Maintainer:  TDY <tdy@gmx.com>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=almanah
pkgver=0.8.0
pkgrel=1
pkgdesc="An encrypted personal diary application"
arch=('i686' 'x86_64')
url="http://tecnocode.co.uk/projects/almanah/"
license=('GPL3')
depends=('evolution-data-server' 'gtkspell>=2.0' 'seahorse')
makedepends=('intltool>=0.35' 'pkgconfig>=0.9')
install=almanah.install
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.bz2)
md5sums=('64064ad790b66417803da513c7ce521e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure	--prefix=/usr --sysconfdir=/etc \
      --with-gconf-schema-file-dir=/usr/share/gconf/schemas \
      --disable-static --disable-schemas-install \
      CFLAGS="$CFLAGS -D_FILE_OFFSET_BITS=64"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir" install
}
