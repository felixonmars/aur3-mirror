# Maintainer: Reza Jelveh <reza.jelveh at tuhh.de>

pkgname=urfkill
pkgver=0.2.0
pkgrel=1
pkgdesc="radio killswitch management daemon"
url="http://www.freedesktop.org/wiki/Software/urfkill"
arch=('i686' 'x86_64')
license=('BSD')
groups=('base')
depends=('glib2' 'sh' 'dbus' 'udev' 'polkit')
backup=('etc/urfkill/urfkill.conf')
options=()
source=("https://github.com/downloads/lcp/$pkgname/$pkgname-$pkgver.tar.bz2" \
        'rc.urfkilld'
        'daemon_patch.diff')
sha1sums=('b87578761fecb7539efe53733e33d32eea68fc96'
          'f96f8d7cecd086c199d2f72a35aac28ae5820a41'
          'ae077bf7c96afe778643fda1e43585241c886ac3')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  patch -p1 < $srcdir/daemon_patch.diff
  # configure variables
  ./configure --sysconfdir=/etc --libexecdir=/usr/lib/urfkill --prefix=/usr

  # Build
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install

  sed -i 's/user=root/user=nobody/' $pkgdir/etc/urfkill/urfkill.conf
  install -D -m755 \
    $srcdir/rc.urfkilld $pkgdir/etc/rc.d/urfkilld || return 1
}
