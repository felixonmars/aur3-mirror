# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Jiyunatori <tori@0xc29.net>

pkgname=a2jmidid
pkgver=8
pkgrel=1
pkgdesc="A daemon for exposing legacy ALSA sequencer applications in JACK MIDI system."
arch=('i686' 'x86_64')
url="http://home.gna.org/$pkgname/"
license=('GPL')
depends=('jack' 'python2-dbus')
source=("http://download.gna.org/$pkgname/$pkgname-$pkgver.tar.bz2"
        "$pkgname-dso-pthread.patch")
md5sums=('9cf4edbc3ad2ddeeaf6c8c1791ff3ddd'
         '4b15e485301aee48371844cb01689ad2')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # DSO link patch
  patch -p1 -i ../$pkgname-dso-pthread.patch

  python2 waf configure --prefix=/usr
  python2 waf
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 waf install --destdir="$pkgdir/"

  # python2 fix
  sed -i "s/python/&2/" "$pkgdir/usr/bin/a2j_control"
}
