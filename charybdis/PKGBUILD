# Contributor: JD Horelick <jdhore1@gmail.com>
# Maintainer: Dennis Schubert <mail@dennis-schubert.de>
pkgname=charybdis
pkgver=3.4.2
pkgrel=7
pkgdesc="A highly-scalable IRCv3-compliant IRC daemon"
arch=('i686' 'x86_64')
url="http://atheme.org/projects/charybdis.html"
license=('GPL2')
depends=(
  'bison'
  'flex'
  'openssl'
  'zlib'
)
source=("http://www.stack.nl/~jilles/irc/$pkgname-$pkgver.tbz2"
        "$pkgname.install"
        "$pkgname.service"
        'fix-example-log-paths.patch')
install=$pkgname.install
sha1sums=('59991a150279b8812a36e4e9d91120d736db0810'
          '868584611f367aa7c689dae98b2b9c6090d8e983'
          'dc51586923c990214a78da19a3833a410503a205'
          '515759d20178e44478704b843094b1a55ce8aaa9')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  # Fix log paths in the example config to avoid problems with
  # people just c&p'ing it...
  patch -p1 < ../fix-example-log-paths.patch
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure \
    --enable-fhs-paths                \
    --enable-openssl                  \
    --enable-ipv6                     \
    --prefix=/usr                     \
    --sysconfdir=/etc/charybdis       \
    --localstatedir=/var/lib          \
    --libexecdir=/usr/lib             \
    --with-rundir=/run                \
    --with-logdir=/var/log/charybdis  \
    --with-program-prefix=charybdis-  \
    ;
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  mkdir -p "$pkgdir/usr/share/doc"
  cp -r doc "$pkgdir/usr/share/doc/charybdis"

  mkdir -p "$pkgdir/usr/lib/tmpfiles.d"
  echo 'd /run/charybdis 0755 charybdis charybdis -' \
    > "$pkgdir/usr/lib/tmpfiles.d/charybdis.conf"
  rm -rf "$pkgdir/run"

  mkdir -p "$pkgdir/usr/lib/systemd/system"
  cp "$srcdir/charybdis.service" "$pkgdir/usr/lib/systemd/system/"
}

# vim: ts=2:sw=2:et
