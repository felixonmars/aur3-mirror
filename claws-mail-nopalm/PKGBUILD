# Maintainer:  Vladimir Chizhov <jagoterr@gmail.com>
# Contributor: Hilton Medeiros <medeiros.hilton AT gmail DOT com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Dieter Plaetinck <dieter@plaetinck.be>

pkgname=claws-mail-nopalm
_pkgname=claws-mail
pkgver=3.7.9
pkgrel=2
pkgdesc="A GTK+ based e-mail client.  Stripped out palmOs support"
arch=('i686' 'x86_64')
license=('GPL3')
url="http://www.claws-mail.org"
depends=('gtk2>=2.18.5' 'gnutls>=2.8.5' 'startup-notification>=0.10' 'enchant>=1.5.0-2'
         'gpgme>=1.2.0' 'libetpan>=1.0' 'libsm>=1.1.1' 'db>=4.8.24' 'dbus-glib>=0.82-2' 'hicolor-icon-theme'
         'desktop-file-utils')
makedepends=('compface' 'spamassassin' 'bogofilter' 'valgrind')
optdepends=('python2:           needed for some tools'
            'perl:              needed for some tools'
            'spamassassin:      adds support for spamfiltering'
            'bogofilter:        adds support for spamfiltering'
            'html2ps:           adds support for printing html mails together with html plugins')
replaces=('sylpheed-claws')
provides=('claws-mail=3.7.9' 'claws')
conflicts=('claws-mail')
options=(!libtool)
install=claws-mail-nopalm.install
source=("http://downloads.sourceforge.net/sourceforge/sylpheed-claws/${_pkgname}-${pkgver}.tar.bz2"
        "claws-mail-3.7.9_notify_crash.patch")
md5sums=('2f9d2dcabf84e312cfeb56efa799b5b3'
         '51c72c0f25c629da0af651beb14da5db')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  (cd src; patch -p0 < $srcdir/claws-mail-3.7.9_notify_crash.patch)
  sed -i 's@^#!.*python.*@#!/usr/bin/python2@' tools/*.py
  ./configure --prefix=/usr --disable-static \
    --enable-enchant \
    --enable-gnutls \
    --enable-ldap \
    --disable-dillo-viewer-plugin \
    --enable-crash-dialog \
    --enable-pgpmime-plugin \
    --enable-spamassassin-plugin \
    --enable-bogofilter-plugin \
    --disable-jpilot

  make
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install

  # build and install extra tools
  cd tools
  make
   # all executables and .conf files ; only top directory
  find -maxdepth 1 -type f -and -perm /111 -or -name '*.conf' | while read i ; do
      install -D -m755 ${i} \
        ${pkgdir}/usr/lib/claws-mail/tools/${i}
  done
}

