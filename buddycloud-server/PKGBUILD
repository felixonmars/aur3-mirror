# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=buddycloud-server
pkgver=0.4.0
pkgrel=1
pkgdesc="A fully distributed social network based on XMPP - server"
arch=(i686 x86_64)
url="https://buddycloud.org/wiki/Main_Page"
license=('Apache')
depends=('nodejs' 'icu' 'expat' 'postgresql-libs')
optdepends=('buddycloud-webclient: the buddycloud web client'
            'prosody: a lightweight and extensible XMPP server'
            'ejabberd: a powerful XMPP server'
            'logrotate: rotate log file automatically'
            "start-stop-daemon: daemon managment if you're not using systemd")
backup=('etc/buddycloud-server/config.js'
        'etc/logrotate.d/buddycloud-server')
install=buddycloud-server.install
source=("https://github.com/buddycloud/buddycloud-server/archive/v${pkgver}.tar.gz"
        'buddycloud-server.rc'
        'buddycloud-server.logrotate')
md5sums=('e8b28c8d995ed3c7910433a105570b00'
         '64ea2b4f6ace15fe057a7029447ded2d'
         '555033f0880c2a40b5e16418b4f2a9f9')
sha256sums=('be38d7a9b634386becb5e8fdee6232ce015725021d3ae5407a95a73f80960558'
            '0bbc3ba58abc520552c9fd47d948a7eb4dacd216dd89f437952fc7418b43c1c8'
            '1696cb64db6fe76c5c32cc32637f485f86f8ea79b0d89ecf5ac4d1615c8f9f4c')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # Build tarball
  npm install .
  npm run-script install
  ./package.js

  # Extract tarball and build required modules
  mkdir build
  cd build
  bsdtar -xf "../buddycloud-server-$pkgver.tar.gz"
  ./build-deps
}

package() {
  mkdir -p "$pkgdir/opt"
  cp -R "$srcdir/$pkgname-$pkgver/build" "$pkgdir/opt/$pkgname"

  cd "$pkgdir/opt/$pkgname"

  install -Dm644 config.js.example "$pkgdir/etc/buddycloud-server/config.js"
  ln -sf ../../etc/buddycloud-server/config.js "$pkgdir/opt/$pkgname/config.js"

  rm config.js.example _etc_init.d_buddycloud-server

  install -Dm755 "$srcdir/buddycloud-server.rc" "$pkgdir/etc/rc.d/buddycloud-server"
  install -Dm644 "$srcdir/$pkgname-$pkgver/buddycloud-server.service" "$pkgdir/usr/lib/systemd/system/buddycloud-server.service"
  install -Dm644 "$srcdir/buddycloud-server.logrotate" "$pkgdir/etc/logrotate.d/buddycloud-server"
}

# vim:set ts=2 sw=2 et:
