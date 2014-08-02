# Maintainer: dx <dx@dxzone.com.ar>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Patrick Burroughs (Celti) <celticmadman@gmail.com>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Florian Bruhin (The-Compiler) <archlinux.org@the-compiler.org>

pkgname=bitlbee-dx-git
pkgver=3.2.2.dx.r10.gf370af0
pkgrel=1
pkgdesc='Brings instant messaging (XMPP, MSN, Yahoo!, AIM, ICQ, Twitter) to IRC'
url='http://www.bitlbee.org/'
license=('GPL')
arch=('i686' 'x86_64')
depends=('gnutls' 'glib2')
makedepends=('git' 'asciidoc' 'libotr' 'xmlto' 'lynx')
checkdepends=('check')
optdepends=('skype4py: to use skyped'
            'libotr: for OTR encryption support')
source=($pkgname'::git+https://github.com/dequis/bitlbee.git'
        'xinetd'
        'bitlbee.tmpfiles')
sha1sums=('SKIP'
          '5e0af27ba9cc4fe455e3381c75fc49a9326e2f17'
          '3695ed2fe22436c4d0fc3ead829f7d1f89bc491c')
backup=('etc/bitlbee/bitlbee.conf'
        'etc/bitlbee/motd.txt')
install=bitlbee.install
provides=('bitlbee' 'bitlbee-bzr')
conflicts=('bitlbee' 'bitlbee-bzr')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"

  ./configure \
    --prefix=/usr \
    --etcdir=/etc/bitlbee \
    --sbindir=/usr/bin \
    --pidfile=/run/bitlbee/bitlbee.pid \
    --ipcsocket=/run/bitlbee/bitlbee.sock \
    --systemdsystemunitdir=/usr/lib/systemd/system \
    --ssl=gnutls \
    --strip=0 \
    --otr=plugin \
    --skype=plugin

  make
}

#check() {
#  cd "$srcdir/bitlbee"
#  make check
#}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install{,-etc,-dev,-systemd}

  install -o65 -g65 -dm700 "$pkgdir/var/lib/bitlbee"
  install -Dm644 "$srcdir/bitlbee.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/bitlbee.conf"
}

# vim:set ts=2 sw=2 et:
