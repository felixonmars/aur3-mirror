# Maintainer: Audric Schiltknecht <storm+arch@chemicalstorm.org>
pkgname=opensand-collector
pkgver=3.0.0
pkgrel=1
pkgdesc="Statistics and events collector for OpenSAND"
arch=('any')
url="http://www.opensand.org"
license=('GPL3')
groups=('opensand')
depends=('python2' 'python2-dbus' 'avahi')
install='opensand-collector.install'
source=("https://launchpad.net/opensand/3.0.x/${pkgver}/+download/opensand-${pkgver}.tar.gz"
        'opensand-collector.tmpfiles' 'opensand-collector@.service')
md5sums=('1e62f66c17397f778d58f79fb42b2564'
         '6ecce6f7e572fd4f946b6bcbb9661d01'
         '89684a83decb012b735c5f948afa6302')

prepare() {
  cd "$srcdir/opensand-$pkgver"
  tar xf $pkgname-$pkgver.tar.gz
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

  # Install tmpfiles and systemd service
  install -D -m644 "$srcdir/opensand-collector.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/opensand-collector.conf"
  install -D -m644 "$srcdir/opensand-collector@.service" "$pkgdir/usr/lib/systemd/system/opensand-collector@.service"

}

# vim:set ts=2 sw=2 et:
