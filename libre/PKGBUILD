# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Luka Perkov <archlinux <at> lukaperkov <dOt> net>

pkgname=libre
pkgver=0.4.9
pkgrel=1
pkgdesc="A library for real-time communications with async IO support, a complete SIP stack with support for SDP, RTP/RTCP, STUN/TURN/ICE and DNS Client"
arch=('i686' 'x86_64')
url="http://www.creytiv.com/"
license=('custom:BSD')
depends=('openssl')
source=("http://www.creytiv.com/pub/re-$pkgver.tar.gz")
md5sums=('0957b658fd19d15d0fa5c9390619fc1e')

build() {
  cd re-$pkgver
  make
}

package() {
  cd re-$pkgver
  make DESTDIR="$pkgdir" install

  # license
  install -Dm644 docs/COPYING \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # fix permission for static lib - not included
#  chmod 644 "$pkgdir/usr/lib/$pkgname.a"
}
