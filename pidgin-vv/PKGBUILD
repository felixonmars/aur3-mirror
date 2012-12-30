# Maintainer: Scott Lawrence <bytbox@gmail.com>

# Forked from `pidgin` PKGBUILD. Old Header:
# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Lucien Immink <l.immink@student.fnt.hvu.nl>

pkgname=('pidgin-vv')
pkgdesc="Multi-protocol instant messaging client, with voice/video support"
pkgver=2.10.6
pkgrel=1
arch=('i686' 'x86_64')
url="http://pidgin.im/"
license=('GPL')
makedepends=('startup-notification' 'gtkspell' 'libxss' 'nss' 'libsasl' 'libsm'
             'libidn' 'python2' 'hicolor-icon-theme' 'gstreamer0.10' 'avahi'
             'tk' 'ca-certificates' 'intltool' 'farstream-0.1' 'dbus-glib')
optdepends=('aspell: for spelling correction'
            'gstreamer0.10-bad: for voice support'
            'avahi: Bonjour protocol support'
            'ca-certificates: SSL CA certificates'
            'python2-dbus: for purple-remote and purple-url-handler'
            'tk: Tcl/Tk scripting support')
options=('!libtool')
conflicts=('pidgin' 'libpurple' 'finch')
provides=('pidgin' 'libpurple' 'finch')
install=pidgin.install
source=(http://downloads.sourceforge.net/pidgin/pidgin-$pkgver.tar.bz2)
sha256sums=('3e25a633b97cbfa8326999a30282e7a662a9b9bbf2853be84af0b8fb60392c96')

build() {
  cd "$srcdir/pidgin-$pkgver"

  # Use Python 2
  sed -i 's/env python$/&2/' */plugins/*.py \
    libpurple/purple-{remote,notifications-example,url-handler}

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --disable-schemas-install \
    --disable-meanwhile \
    --disable-gnutls \
    --enable-cyrus-sasl \
    --disable-doxygen \
    --disable-nm \
    --enable-vv \
    --with-python=/usr/bin/python2 \
    --with-system-ssl-certs=/etc/ssl/certs
    make
}

package_pidgin-vv(){
  cd "$srcdir/pidgin-$pkgver"

  # For linking
  for _dir in libpurple share/sounds share/ca-certs m4macros po; do
    make -C "$_dir" DESTDIR="$pkgdir" install
  done

  make -C finch DESTDIR="$pkgdir" install
  make -C pidgin DESTDIR="$pkgdir" install
  make -C doc DESTDIR="$pkgdir" install

  install -Dm644 pidgin.desktop "$pkgdir"/usr/share/applications/pidgin.desktop
}

# vim:set ts=2 sw=2 et:
