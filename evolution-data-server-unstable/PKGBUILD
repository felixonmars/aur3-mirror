_pkgname=evolution-data-server
pkgname=evolution-data-server-unstable
pkgver=3.13.7
pkgrel=1
pkgdesc="Centralized access to appointments and contacts [Unstable version]"
arch=(i686 x86_64)
conflicts=('evolution-data-server')
provides=('evolution-data-server')
depends=(gnome-online-accounts nss krb5 libgweather libical db libgdata)
makedepends=(intltool gperf gobject-introspection vala python2)
install=$_pkgname.install
url="https://wiki.gnome.org/Apps/Evolution"
license=(GPL)
source=(http://ftp.gnome.org/pub/gnome/sources/$_pkgname/${pkgver:0:4}/$_pkgname-$pkgver.tar.xz)
md5sums=('1ada97bda60ce1b4cf69254354fa7765')

build() {
  cd "$_pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --with-openldap=yes \
      --libexecdir=/usr/lib/evolution-data-server \
      --with-krb5=/usr --with-libdb=/usr \
      --enable-vala-bindings --disable-uoa
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' -e 's/    if test "$export_dynamic" = yes && test -n "$export_dynamic_flag_spec"; then/      func_append compile_command " -Wl,-O1,--as-needed"\n      func_append finalize_command " -Wl,-O1,--as-needed"\n\0/' libtool
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
