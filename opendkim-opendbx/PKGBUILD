# Maintainer: Leonard de Ruijter <leonard@aur.archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Thomas Jost <schnouki@schnouki.net>

_pkgname=opendkim
pkgname=opendkim-opendbx
pkgver=2.9.2
pkgrel=1
pkgdesc="An open source implementation of the DKIM sender authentication system including opendbx support. Based on a fork of dkim-milter."
arch=(i686 x86_64)
url="http://www.opendkim.org/"
license=('BSD' 'custom:Sendmail')
depends=("db" "opendbx" "openssl" "libbsd")
makedepends=("libmilter")
provides=('opendkim')
conflicts=('opendkim')
options=(!emptydirs)
backup=(etc/conf.d/opendkim)
install=opendkim.install
source=(http://downloads.sourceforge.net/project/$_pkgname/$_pkgname-$pkgver.tar.gz
	$_pkgname.conf
	$_pkgname.service)
md5sums=('08cc80a2aedec62b0444d8d6af24a155'
         '3e2bb1058ac0662f01e675aa6ac7ee8f'
         '85010750a21954e2d3cf5d57fe210d3f')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure --prefix=/usr --sbindir=/usr/bin --with-db --with-odbx --with-sql-backend
  make
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  make check
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install

  # Sample configuration
  mkdir -p "$pkgdir/etc/opendkim"
  mv "$pkgdir/usr/share/doc/opendkim/opendkim.conf.sample" "$pkgdir/etc/opendkim/opendkim.conf.sample"
  chmod 0700 "$pkgdir/etc/opendkim"
  chmod 0600 "$pkgdir/etc/opendkim/opendkim.conf.sample"
  install -Dm644 "$srcdir/opendkim.conf" "$pkgdir/etc/conf.d/opendkim"

  # License
  mkdir -p "$pkgdir/usr/share/licenses/opendkim"
  for f in LICENSE LICENSE.Sendmail; do
    ln -s ../../doc/opendkim/$f "$pkgdir/usr/share/licenses/opendkim/$f"
  done

  install -Dm0644 $srcdir/$_pkgname.service $pkgdir/usr/lib/systemd/system/$_pkgname.service
}
