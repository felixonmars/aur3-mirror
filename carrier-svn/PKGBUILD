# Maintainer: Jonathan Schmidt <j.schmidt@archlinux.us>
pkgname=carrier-svn
pkgver=89
pkgrel=1
pkgdesc="Pidgin fork providing minor GUI enhancements (formerly funpidgin)"
arch=(i686 x86_64)
url="http://funpidgin.sf.net"
license=('GPL')
depends=('gtk2' 'startup-notification' 'hicolor-icon-theme' 'libxss' 'dbus-glib'
        'farsight2' 'libsasl' 'nss' 'silc-toolkit' 'gconf>=2.18.0.1-4'
        'desktop-file-utils')
makedepends=('subversion')
optdepends=('gstreamer0.10-good: to play sounds'
            'avahi: Bonjour protocol support'
            'ca-certificates: SSL CA certificates'
            'tk: Tcl/Tk scripting support'
            'gtkspell: for spelling error highlighting'
            'aspell: for spelling correction')
provides=('carrier' 'libpurple=2.6.4' 'pidgin' 'finch')
conflicts=('carrier' 'libpurple' 'pidgin' 'finch')
options=(!libtool !emptydirs)
install=carrier-svn.install
source=(oscar-fix.patch)
md5sums=(4722762ee279256d06033e57b0dee9de)

_svntrunk=https://funpidgin.svn.sourceforge.net/svnroot/funpidgin/carrier/trunk
_svnmod=carrier

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  #msg "Applying Carrier patches..."
  #quilt push -a || return 1

  msg "Patching AIM/ICQ to fix garbling of messages from mobile users..."
  patch -Np0 -i $startdir/oscar-fix.patch || return 1

  msg "Starting make..."

  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-schemas-install --enable-cyrus-sasl --disable-doxygen \
              --disable-gnutls --with-system-ssl-certs=/etc/ssl/certs \
              --disable-meanwhile --disable-perl --disable-tk --disable-tcl \
              --disable-gtkspell --disable-avahi --disable-nm \
              --disable-gevolution --disable-nls --disable-idn \
              --disable-gestures || return 1
  make || return 1
  make -j1 GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir/" install || return 1

  install -m755 -d "$pkgdir"/usr/share/gconf/schemas
  gconf-merge-schema "$pkgdir"/usr/share/gconf/schemas/${pkgname}.schemas \
    "$pkgdir"/etc/gconf/schemas/*.schemas || return 1
  rm -f "$pkgdir"/etc/gconf/schemas/*.schemas
}
