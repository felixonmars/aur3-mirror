pkgname=email2trac
pkgver=2.5.0
pkgrel=1
pkgdesc="Tool to convert emails to trac tickets"
arch=('i686' 'x86_64')
url="https://subtrac.sara.nl/oss/email2trac"
backup=(etc/email2trac.conf)
license=('GPL')
depends=('smtp-server' 'trac')
install=$pkgname.install
source=(ftp://ftp.sara.nl/pub/outgoing/$pkgname.tar.gz)
md5sums=('763d3106f6c14dd9d943907ba6b5b2b8')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc --with-mta_user=nobody --with-trac_user=http
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
