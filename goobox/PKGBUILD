# Maintainer:  TDY <tdy@gmx.com>
# Contributor: Nathan Owe <ndowens04 : gmail>
# Contributor: Andrew Munkres <amunkres : gmail>

pkgname=goobox
pkgver=2.2.0
pkgrel=2
pkgdesc="A CD player and ripper for the GNOME desktop"
arch=('i686' 'x86_64')
url="http://ftp.gnome.org/pub/GNOME/sources/goobox/"
license=('GPL')
depends=('brasero' 'hicolor-icon-theme' 'musicbrainz>=2.1.0')
makedepends=('gnome-doc-utils>=0.3.2' 'intltool>=0.35.0' 'libgnomeui>=2.16.0'
             'pkgconfig>=0.9.0')
optdepends=('libnotify>=0.4.3')
install=goobox.install
source=(http://ftp.gnome.org/pub/GNOME/sources/goobox/${pkgver%.*}/$pkgname-$pkgver.tar.bz2
        $pkgname-$pkgver-libnotify-0.7.patch)
md5sums=('cc81756658e88353a0d0857f40787bd2'
         '8dad2618fc95a3fc0b8180bff59ff3fe')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i '2 c\_Name=Goobox' data/$pkgname.desktop.in.in
  patch -Np0 -i ../$pkgname-$pkgver-libnotify-0.7.patch
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir" install
  install -dm755 "$pkgdir/usr/share/gconf/schemas"
  gconf-merge-schema "$pkgdir/usr/share/gconf/schemas/$pkgname.schemas" \
    "$pkgdir/etc/gconf/schemas/$pkgname.schemas"
  rm -rf "$pkgdir/etc"
}
