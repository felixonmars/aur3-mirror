# Maintainer: Audren Cezar <audrencezar@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Lucien Immink <l.immink@student.fnt.hvu.nl>

pkgbase=('pidgin')
pkgname=('pidgin-invisible')
provides=('pidgin' 'libpurple' 'libpurple-invisible')
conflicts=('pidgin' 'libpurple')
pkgver=2.6.6
pkgrel=2
pkgdesc="Multi-protocol instant messaging client and libpurple with gtalk invisible patch"
arch=('i686' 'x86_64')
url="http://pidgin.im/"
license=('GPL')
makedepends=('startup-notification' 'gtkspell' 'libxss' 'nss' 'libsasl' 'python'
	'hicolor-icon-theme' 'silc-toolkit' 'gstreamer0.10-base' 'farsight2' 'avahi'
	'tk' 'ca-certificates' 'intltool' 'networkmanager')
options=('!libtool')
source=(http://downloads.sourceforge.net/${pkgbase}/${pkgver}/${pkgbase}-${pkgver}.tar.bz2
http://developer.pidgin.im/raw-attachment/ticket/4509/gtalk-sharedstatus-2.6.6.patch)
md5sums=('b37ab6c52db8355e8c70c044c2ba17c1'
         '49ed4e2e28a329d7db007975b620272e')
install=pidgin.install
depends=('farsight2' 'libsasl' 'dbus-glib' 'silc-toolkit' 'nss' 'startup-notification' 'gtkspell' 'libxss' 'python' 'hicolor-icon-theme' 'gstreamer0.10-base')
optdepends=('cyrus-sasl-plugins: needed for facebook xmpp authentication'
		'gstreamer0.10-good: to play sounds'
                'avahi: Bonjour protocol support'
                'tk: Tcl/Tk scripting support'
                'ca-certificates: SSL CA certificates'
                'aspell: for spelling correction' )


build() {
    cd "$srcdir/$pkgbase-$pkgver"
    patch -p1 -i "$srcdir/gtalk-sharedstatus-${pkgver}.patch" || return 1
    ./configure --prefix=/usr \
                --sysconfdir=/etc \
                --disable-schemas-install \
                --disable-meanwhile \
                --disable-perl \
                --disable-gnutls \
                --enable-cyrus-sasl \
                --disable-doxygen \
		--enable-nm \
                --with-system-ssl-certs=/etc/ssl/certs || return 1
    make || return 1
    
    # libpurple    
    for dir in libpurple share/sounds share/ca-certs m4macros po
    do
	make -C "$dir" DESTDIR="$pkgdir" install || return 1
    done

    # pidgin
    #for linking
    make -C libpurple DESTDIR="$pkgdir" install-libLTLIBRARIES || return 1

    make -C pidgin DESTDIR="$pkgdir" install || return 1
    make -C doc DESTDIR="$pkgdir" install || return 1

    install -D -m 0644 pidgin.desktop "$pkgdir"/usr/share/applications/pidgin.desktop || return 1

    rm -f "$pkgdir"/usr/share/man/man1/finch.1 || return 1
}
