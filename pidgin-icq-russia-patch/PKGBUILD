# Contributor: Michail "mnk" Pavlenko <maniak.net [at] gmail [dot] com>

pkgname=pidgin-icq-russia-patch
pkgver=2.5.4
pkgrel=1
pkgdesc="Pidgin IM with patch that fixes connection problem for russian users"
arch=('i686' 'x86_64')
url="http://developer.pidgin.im/ticket/8198"
license=('GPL')
depends=('startup-notification' 'gtkspell' 'libxss' 'gstreamer0.10'
         'nss' 'libsasl' 'python' 'hicolor-icon-theme')
makedepends=('avahi' 'tk' 'ca-certificates' 'intltool')
optdepends=('avahi: Bonjour protocol support'
            'tk: Tcl/Tk scripting support'
            'ca-certificates: SSL CA certificates')
provides=('pidgin')
conflicts=('pidgin')
replaces=('gaim')
options=('!libtool')
install=pidgin.install
source=(http://downloads.sourceforge.net/pidgin/pidgin-$pkgver.tar.bz2
		http://developer.pidgin.im/raw-attachment/ticket/8198/pidgin-NOT-UPSTREAM-2.5.4-icq-russia.patch)

build() {
  cd $srcdir
  patch -i ${startdir}/pidgin-NOT-UPSTREAM-2.5.4-icq-russia.patch -p0
  cd "$srcdir/pidgin-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc --disable-schemas-install --disable-meanwhile \
    --disable-nm --disable-perl --disable-gnutls --enable-cyrus-sasl --disable-doxygen \
    --with-system-ssl-certs=/etc/ssl/certs || return 1
  make || return 1
  make DESTDIR="$pkgdir" install || return 1

  rm -rf "$pkgdir/etc" || return 1
}
md5sums=('295fe533288c821342b660b6fc83bc11'
         'd9fcb4fa26c80aeccdf5013d4845f07f')
