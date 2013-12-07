# Contributor: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: Glenn Matthys <glenn@webmind.be>

pkgname=proxsmtp
pkgver=1.10
pkgrel=1
pkgdesc="A Flexible SMTP filter that allows you to reject, change, or log email based on arbitrary critiera."
arch=(i686 x86_64)
license=('custom')
depends=('smtp-server')
backup=('etc/proxsmtpd.conf')
url="http://thewalter.net/stef/software/proxsmtp/"
source=("http://thewalter.net/stef/software/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('33b13cb4cbbebd784768893404c992d6cc2e8d057c27c012e3a69f24ac60c4b5')

prepare() {
  sed -i 's/^#User:/User:/' "$srcdir/$pkgname-$pkgver/doc/proxsmtpd.conf"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

  install -Dm644 doc/proxsmtpd.conf "$pkgdir/etc/proxsmtpd.conf"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/${pkgname}/COPYING"

  install -dm755 "$pkgdir/var/run/proxsmtpd"
  chown nobody.nobody "$pkgdir/var/run/proxsmtpd"
}
