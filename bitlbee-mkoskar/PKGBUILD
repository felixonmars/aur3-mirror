# Maintainer: Miroslav Koskar (http://mkoskar.com/)

# Based on bitlbee-3.2.2-1:
# Contributor: FUBAR <mrfubar@gmail.com>
# Contributor: simo <simo@archlinux.org>
# Contributor: Jeff 'codemac' Mickey <jeff@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Maintainer: Dave Reisner <dreisner@archlinux.org>

_basename='bitlbee'

pkgname='bitlbee-mkoskar'
pkgver='3.2.2'
pkgrel=1
pkgdesc="Brings instant messaging (XMPP, MSN, Yahoo!, AIM, ICQ, Twitter) to IRC (mkoskar's patchset)"
url='https://github.com/mkoskar/pkgbuilds/tree/master/bitlbee-mkoskar'
license=('GPL')
arch=('i686' 'x86_64')
provides=('bitlbee')
conflicts=('bitlbee')
depends=('gnutls' 'glib2' 'libevent')
optdepends=('skype4py: to use skyped' 'libotr: for OTR encryption support')
makedepends=('asciidoc' 'libotr')

source=("http://get.bitlbee.org/src/$_basename-$pkgver.tar.gz"
        'bitlbee.tmpfiles'
        'skype-displayname.patch'
        'twitter-account-tag-as-name.patch')
sha1sums=('7e3cfe2b6bf4e8e603c74e7587307a6f5d267e9c'
          '3695ed2fe22436c4d0fc3ead829f7d1f89bc491c'
          'b6b6574126e0981d5f34b40ec9d3b811aeb07d6d'
          '0a6aa3c61434ee2a6e55cfebd1eeef445b25345e')
backup=('etc/bitlbee/bitlbee.conf'
        'etc/bitlbee/motd.txt')
install="$_basename.install"

prepare() {
    cd "$srcdir/$_basename-$pkgver"

    patch -Np1 -i "$srcdir/skype-displayname.patch"
    patch -Np1 -i "$srcdir/twitter-account-tag-as-name.patch"
}

build() {
    cd "$srcdir/$_basename-$pkgver"

    ./configure \
        --prefix=/usr \
        --etcdir=/etc/bitlbee \
        --sbindir=/usr/bin \
        --pidfile=/run/bitlbee/bitlbee.pid \
        --ipcsocket=/run/bitlbee/bitlbee.sock \
        --systemdsystemunitdir=/usr/lib/systemd/system \
        --ssl=gnutls \
        --events=libevent \
        --strip=0 \
        --otr=plugin \
        --skype=plugin

    make
}

package() {
    cd "$srcdir/$_basename-$pkgver"

    make DESTDIR="$pkgdir" install{,-etc,-dev,-systemd}

    install -d -o 65 -g 65 -m 770 "$pkgdir"/var/lib/bitlbee
    install -D -m 644 "$srcdir"/bitlbee.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/bitlbee.conf
}
