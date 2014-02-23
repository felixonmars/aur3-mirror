# Maintainer:  Vladimir Chizhov <jagoterr@gmail.com>
# Contributor: Hilton Medeiros <medeiros.hilton AT gmail DOT com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Dieter Plaetinck <dieter@plaetinck.be>
pkgname=claws-mail-minimal
_pkgname=claws-mail
pkgver=3.9.3
pkgrel=1
pkgdesc="A GTK+ based e-mail client. Stripped out palmOs and antispam support"
arch=('i686' 'x86_64')
license=('GPL3')
url="http://www.claws-mail.org"
depends=('gtk2' 'gnutls' 'startup-notification' 'enchant'
         'gpgme' 'libetpan' 'libsm' 'db' 'dbus-glib' 'hicolor-icon-theme'
         'desktop-file-utils')
makedepends=('compface')
optdepends=('python2:           needed for some tools and python plugin'
            'perl:              needed for some tools and perl plugin'
            'html2ps:           adds support for printing html mails with fancy plugin'
            'spamassassin:      adds support for spamfiltering'
            'bogofilter:        adds support for spamfiltering'
            'libnotify:         for notification plugin'
            'libcanberra:       for notification plugin'
            'dbus:              for notification plugin'
            'libxml2:           for gtkhtml2_viewer and rssyl plugins'
            'curl:              for gtkhtml2_viewer, vcalendar, rssyl and spamreport plugins'
            'libarchive:        for archive plugin and various other plugins'
            'libytnef:          for tnef_parse plugin'
            'webkitgtk2:        for the fancy webkit html plugin'
            'libsoup:           for the fancy webkit html plugin'
            'libgdata:          for gdata plugin'
            'poppler-glib:      for pdf viewer plugin'
            'ghostscript:       for pdf viewer plugin')
replaces=('sylpheed-claws' 'claws-mail-extra-plugins')
provides=('claws-mail=3.9.2' 'claws')
conflicts=('claws-mail' 'claws-mail-nopalm' 'claws-mail-extra-plugins')
options=(!libtool)
install=claws-mail-minimal.install
source=("http://downloads.sourceforge.net/sourceforge/sylpheed-claws/${_pkgname}-${pkgver}.tar.bz2")
md5sums=('0158b5e6b6d6866f9a75fd288a4edf04')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  # fixes for python2
  export PYTHON="/usr/bin/python2"
  sed -i 's@^#!.*python.*@#!/usr/bin/python2@' tools/*.py
  sed -i 's:python -c:python2 -c:g' configure

  ./configure --prefix=/usr --disable-static \
    --enable-enchant \
    --enable-gnutls \
    --enable-ldap \
    --disable-dillo-viewer-plugin \
    --enable-crash-dialog \
    --enable-pgpmime-plugin \
    --disable-spamassassin-plugin \
    --disable-bogofilter-plugin \
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

