# Maintainer: Audric Schiltknecht <storm+arch@chemicalstorm.org>
pkgname=opensand-daemon
pkgver=3.0.0
pkgrel=1
pkgdesc="Daemon for OpenSAND entity (sat, gw, st or ws)"
arch=('i686' 'x86_64')
url="http://www.opensand.org"
license=('GPL3')
groups=('opensand')
depends=('opensand-core'
         'python2' 'libnl' 'python2-dbus' 'python2-prctl' 'python2-ipaddr' 'python2-netifaces' 'avahi')
install='opensand-daemon.install'
source=("https://launchpad.net/opensand/3.0.x/${pkgver}/+download/opensand-${pkgver}.tar.gz"
        'https://raw.githubusercontent.com/thom311/libnl/libnl3_2_24/python/netlink/utils.h'
        'opensand-daemon.tmpfiles'
        'opensand-daemon.service')
md5sums=('1e62f66c17397f778d58f79fb42b2564'
         'eb863862a1b99bee3501b776957309b6'
         'def3008b76ecb788e9f337eb5a1f1124'
         '3e95728b3f3b3d7d7269c66146ac9759')

prepare() {
  cd "$srcdir/opensand-$pkgver"
  tar xf $pkgname-$pkgver.tar.gz
  cp "$srcdir/utils.h" "$srcdir/opensand-$pkgver/$pkgname-$pkgver/netlink/"
}

build() {
  cd "$srcdir/opensand-$pkgver/$pkgname-$pkgver"
  python2 setup.py build
}

check() {
  cd "$srcdir/opensand-$pkgver/$pkgname-$pkgver"
  python2 setup.py test
}

package() {
  cd "$srcdir/opensand-$pkgver/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1

  # Remove debian-specific stuff
  rm -rf ${pkgdir}/usr/libexec

  # Set default configuration
  install -Dm644 "${srcdir}/opensand-${pkgver}/${pkgname}-${pkgver}/conf/daemon.conf" "${pkgdir}/etc/opensand/daemon.conf"

  # Install tmpfiles and systemd service
  install -D -m644 "$srcdir/opensand-daemon.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/opensand-daemon.conf"
  install -D -m644 "$srcdir/opensand-daemon.service" "$pkgdir/usr/lib/systemd/system/opensand-daemon.service"
}

# vim:set ts=2 sw=2 et:
