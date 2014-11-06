_pkgname=evolution
pkgname=evolution-unstable
pkgver=3.13.7
pkgrel=1
pkgdesc="Manage your email, contacts and schedule [Unstable version]"
arch=(i686 x86_64)
license=(GPL)
conflicts=('evolution')
provides=('evolution')
depends=(gnome-desktop evolution-data-server-unstable gtkhtml4 libcanberra libpst libytnef psmisc
         desktop-file-utils hicolor-icon-theme dconf gtkspell3)
makedepends=(intltool itstool docbook-xsl networkmanager bogofilter spamassassin highlight)
optdepends=('bogofilter: possible junk filter plugin'
            'spamassassin: possible junk filter plugin'
            'highlight: text highlight plugin')
groups=('gnome-extra')
options=('!emptydirs')
install=evolution.install
url=https://wiki.gnome.org/Apps/Evolution
source=(http://ftp.gnome.org/pub/gnome/sources/$_pkgname/${pkgver:0:4}/$_pkgname-$pkgver.tar.xz)
md5sums=('71724fae8ca9c22b7fbf0eb0bfdda940')

build() {
  cd $_pkgname-$pkgver

  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var \
      --libexecdir=/usr/lib \
      --enable-nss=yes \
      --with-openldap=yes \
      --enable-smime=yes \
      --disable-schemas-compile \
      --disable-libcryptui

  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' -e 's/    if test "$export_dynamic" = yes && test -n "$export_dynamic_flag_spec"; then/      func_append compile_command " -Wl,-O1,--as-needed"\n      func_append finalize_command " -Wl,-O1,--as-needed"\n\0/' libtool

  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
