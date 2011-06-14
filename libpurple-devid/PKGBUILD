# $Id: PKGBUILD 126832 2011-06-07 15:43:55Z foutrelis $
# Maintainer: Evangelos Foutras <foutrelis@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Lucien Immink <l.immink@student.fnt.hvu.nl>
# Contributor: Robin Kreis <robin.kreis@uni-bremen.de>

pkgname=('libpurple-devid')
pkgver=2.8.0
pkgrel=1
arch=('i686' 'x86_64')
url="http://pidgin.im/"
license=('GPL')
makedepends=('startup-notification' 'gtkspell' 'libxss' 'nss' 'libsasl' 'libsm'
             'python2' 'hicolor-icon-theme' 'silc-toolkit' 'gstreamer0.10'
             'farsight2' 'avahi' 'tk' 'ca-certificates' 'intltool'
             'networkmanager')
options=('!libtool')
source=(http://downloads.sourceforge.net/pidgin/pidgin-$pkgver.tar.bz2
        nm09-more.patch
        icq-devid.patch)
md5sums=('d1656c443a5d91f4aa0d95915f1f50c3'
         'a673659d86c7a65aa710f7c8c7feda82'
         '15805528f4199ea76e10475881e55a21')

build() {
  cd "$srcdir/pidgin-$pkgver"

  # Further fixes for NetworkManager 0.9
  # (http://developer.pidgin.im/ticket/13859)
  patch -Np1 -i "$srcdir/nm09-more.patch"
  patch -Np1 -i "$srcdir/icq-devid.patch"

  # Use Python 2
  sed -i 's/env python$/\02/' */plugins/*.py \
    libpurple/purple-{remote,notifications-example,url-handler}

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

package_libpurple-devid(){
  pkgdesc="IM library extracted from Pidgin with DevID patch to fix ICQ"
  provides=('libpurple=2.8.0-1')
  conflicts=('libpurple')
  depends=('farsight2' 'libsasl' 'dbus-glib' 'silc-toolkit' 'nss'
           'cyrus-sasl-plugins')
  optdepends=('avahi: Bonjour protocol support'
              'dbus-python: for purple-remote and purple-url-handler')

  cd "$srcdir/pidgin-$pkgver"

  for _dir in libpurple share/sounds share/ca-certs m4macros po; do
    make -C "$_dir" DESTDIR="$pkgdir" install
  done
}

# vim:set ts=2 sw=2 et:
