pkgname=pidgin-gnome
pkgver=2.7.1
pkgrel=1
pkgdesc="Multi-protocol instant messaging client"
arch=('i686' 'x86_64')
url="http://pidgin.im/"
license=('GPL')
depends=('startup-notification' 'gtkspell' 'libxss' 'gstreamer0.10' 'avahi' 'ca-certificates' 'nss' 'libsasl' 'python' 'hicolor-icon-theme' 'gnome-keyring' 'farsight2' 'silc-toolkit')
makedepends=( 'intltool')
replaces=('gaim' 'pidgin')
provides=('gaim' 'pidgin')
options=('!libtool')
install=pidgin.install
source=(http://downloads.sourceforge.net/pidgin/pidgin-${pkgver}.tar.bz2 pidgin-01-gnome-keyring.diff)

build() {
  cd "$srcdir/pidgin-${pkgver}"
  patch -p0 < $srcdir/pidgin-01-gnome-keyring.diff || return 1
  autoreconf 

./configure --prefix=/usr --sysconfdir=/etc --disable-schemas-install \
  --disable-meanwhile --enable-gnome-keyring --disable-nm --disable-perl \
  --disable-gnutls --enable-cyrus-sasl --disable-doxygen --disable-tcl \
  --with-system-ssl-certs=/etc/ssl/certs || return 1

  make || return 1
  make DESTDIR="$pkgdir" install || return 1
## Install the schemas file
 mkdir -p ${startdir}/pkg/usr/share/gconf/schemas
 gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/pidgin.schemas ${startdir}/pkg/etc/gconf/schemas/purple.schemas
 rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas
}
md5sums=('0dd2adb9e8214ac960f956823c84e7e2'
         'fbcd8dff2db18eb04a0fb162f79acf55')
