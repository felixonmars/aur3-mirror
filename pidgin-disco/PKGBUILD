# Contributor: Gary Mann <garymann1001 gmail com>
# Maintainer: Gary Mann <garymann1001 gmail com

pkgname=pidgin-disco
pkgver=2.5.6
pkgrel=1
pkgdesc="Multi-protocol instant messaging client, Pidgin with XMPP service discovery"
arch=('i686' 'x86_64')
url="http://pidgin.im/"
license=('GPL')
depends=('startup-notification' 'gtkspell' 'libxss' 'gstreamer0.10'
         'nss' 'libsasl' 'python' 'hicolor-icon-theme')
makedepends=('avahi' 'tk' 'ca-certificates' 'intltool')
optdepends=('avahi: Bonjour protocol support'
            'tk: Tcl/Tk scripting support'
            'ca-certificates: SSL CA certificates')
replaces=('gaim')
options=('!libtool')
install=pidgin.install
source=(http://downloads.sourceforge.net/pidgin/pidgin-$pkgver.tar.bz2 \
	"disco-2.patch"
)
md5sums=('75bf724a61047eaaecad869ab452e475'
         '5f7876a69b7cb9b6850ee64735197d77')


trap cleanup 1 2 3 6

cleanup()
{
  echo -e "\nCaught a Signal ... cleaning up."
    rm -Rf $srcdir
  echo "Done cleanup ... quitting."
exit 1
}

	 
mkdir -p pkg
cp disco-2.patch pkg/	
build() {
  cd "$srcdir/pidgin-$pkgver/"
  patch -Np0 < ../../pkg/disco-2.patch
  rm ../../pkg/disco-2.patch
  aclocal --verbose
  automake --verbose
  ./configure --prefix=/usr --sysconfdir=/etc --disable-schemas-install --disable-meanwhile \
    --disable-nm --disable-perl --disable-gnutls --enable-cyrus-sasl --disable-doxygen \
    --with-system-ssl-certs=/etc/ssl/certs || return 1
  make LIBTOOL=/usr/bin/libtool || return 1
  make DESTDIR="$pkgdir" LIBTOOL=/usr/bin/libtool install || return 1

  # Remove GConf schema file
  rm -rf "$pkgdir/etc" || return 1
}

