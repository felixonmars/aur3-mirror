# Maintainer: Mantas M. <grawity@gmail.com>
pkgname=shishi
pkgver=1.0.2
pkgrel=1
pkgdesc="a GNU implementation of the Kerberos 5 network security system"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/shishi/"
license=('GPL3')
depends=(
  'gnutls'
  'libidn'
  'libgcrypt'
  'libgpg-error'
  'libtasn1'
  'pam'
)
makedepends=(
  'help2man'
)
backup=(
  'etc/shishi/shisa.conf'
  'etc/shishi/shishi.conf'
)
install="$pkgname.install"
source=("ftp://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz"
        "ftp://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz.sig"
        "shishid.service")
sha1sums=('c065838baae18d2e39ccd0556e7b7364e2db48bb'
          'SKIP'
          '4f3ab42060102d1bcce260fa333e86d8a8c37e99')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure \
    --prefix=/usr         \
    --sysconfdir=/etc     \
    --localstatedir=/var  \
    --libdir=/usr/lib     \
    ;
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -dm0700 "$pkgdir/var/shishi"
  make DESTDIR="$pkgdir/" install

  install -Dm0644 "$srcdir/shishid.service" "$pkgdir/usr/lib/systemd/system/shishid.service"
}

# vim:set ts=2 sw=2 et:
