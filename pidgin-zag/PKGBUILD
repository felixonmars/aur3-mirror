# Maintainer:  Eugen Zagorodniy <e dot zagorodniy at gmail dot com>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Lucien Immink <l.immink@student.fnt.hvu.nl>

pkgname='pidgin-zag'
pkgver=2.10.6
pkgrel=1
arch=('i686' 'x86_64')
url="http://pidgin.im/"
license=('GPL')
pkgdesc="Pidgin with patch for ticket 10593"
depends=('libpurple' 'startup-notification' 'gtkspell' 'libxss' 'libsm'
         'gstreamer0.10' 'hicolor-icon-theme')
makedepends=('startup-notification' 'gtkspell' 'libxss' 'nss' 'libsasl' 'libsm'
             'libidn' 'python2' 'hicolor-icon-theme' 'gstreamer0.10'
             'farstream' 'avahi' 'tk' 'ca-certificates' 'intltool'
             'networkmanager')
optdepends=('aspell: for spelling correction'
            'gstreamer0.10-good-plugins: video and voice support')
provides=('pidgin')
conflicts=('pidgin')
options=('!libtool')
install=pidgin.install
source=(http://downloads.sourceforge.net/pidgin/pidgin-$pkgver.tar.bz2
        http://developer.pidgin.im/raw-attachment/ticket/10593/pidgin-ticket-10593.patch)
sha256sums=('3e25a633b97cbfa8326999a30282e7a662a9b9bbf2853be84af0b8fb60392c96'
            '1947fb4992264322d37b5ad0ee4b2a764fc12c98077e94b9b4cd970416511988')
build() {
  cd "$srcdir/pidgin-$pkgver"

  # Use Python 2
  sed -i 's/env python$/&2/' */plugins/*.py \
    libpurple/purple-{remote,notifications-example,url-handler}

  # #10593: Tray notification for jabber groupchats
  # http://developer.pidgin.im/ticket/10593
  patch -Np1 -i "$srcdir/pidgin-ticket-10593.patch"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --disable-schemas-install \
    --disable-meanwhile \
    --disable-gnutls \
    --enable-cyrus-sasl \
    --disable-doxygen \
    --enable-nm \
    --with-python=/usr/bin/python2 \
    --with-system-ssl-certs=/etc/ssl/certs
    make
}

package(){
  cd "$srcdir/pidgin-$pkgver"

  # For linking
  make -C libpurple DESTDIR="$pkgdir" install-libLTLIBRARIES

  make -C pidgin DESTDIR="$pkgdir" install
  make -C doc DESTDIR="$pkgdir" install

  # Remove files that are packaged in libpurle
  make -C libpurple DESTDIR="$pkgdir" uninstall-libLTLIBRARIES

  install -Dm644 pidgin.desktop "$pkgdir"/usr/share/applications/pidgin.desktop

  rm "$pkgdir/usr/share/man/man1/finch.1"
}
