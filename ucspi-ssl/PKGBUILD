# Maintainer: Andres Erbsen <andres@krutt.org>
# Contributors: eric <eric@archlinux.org>, Manolis Tzanidakis
pkgname=ucspi-ssl
pkgver=0.84
pkgrel=1
pkgdesc="Command-line tools for building SSL client-server applications."
arch=(i686 x86_64 armv6h)
url="http://www.fehcom.de/ipnet/ucspi-ssl.html"
license=('public-domain')
depends=('openssl' 'ucspi-tcp')
source=(http://www.fehcom.de/ipnet/ucspi-ssl/$pkgname-$pkgver.tgz)
md5sums=('3a3347d1b80e9962a0bab49b0b4d8692')

prepare() {
  cd "$srcdir/host/superscript.com/net/$pkgname-$pkgver/src"
  sed -i -e 's:HOME/command:/usr/bin:' sslcat.sh sslconnect.sh https\@.sh
  echo "gcc -s" > conf-ld
  echo "/usr/bin" > conf-tcpbin
  echo "/etc/ssl/certs/" > conf-cadir
  echo -n > conf-dhfile
}

build() {
  cd "$srcdir/host/superscript.com/net/$pkgname-$pkgver"
  ./package/compile || return 1
}

package() {
  cd "$srcdir/host/superscript.com/net/$pkgname-$pkgver/compile"
  for i in sslserver sslclient sslcat sslconnect https\@; do
    install -D -m755 "$i" "$pkgdir/usr/bin/$i"
  done

  cd ../man
  for c in 1 2; do
    for i in *.$c; do
      gzip -fk "$i"
      install -D -m644 "$i.gz" "$pkgdir/usr/share/man/man$c/$i.gz"
    done
  done
}

# vim: ts=2 sw=2 et
