# Maintainer: Sergey Rublev <narma.nsk@gmail.com>

pkgname=foundationdb
pkgver="3.0.5"
pkgrel=1
pkgdesc="Distributed key/value store with ACID transactions"
license=('custom')
url="https://foundationdb.com/get"
depends=('python2' 'readline')
makedepends=('libarchive')
arch=('x86_64')
source=(manual://foundationdb-clients_${pkgver}-${pkgrel}_amd64.deb
        manual://foundationdb-server_${pkgver}-${pkgrel}_amd64.deb
        foundationdb.service
        CommunityLicenseAgreement.pdf)
backup=('etc/foundationdb/foundationdb.conf')
install=foundationdb.install
md5sums=('e77768a5e71504f3470e03eadb4c9883'
         '85199824dbbbff55f31c54a3da09420f'
         'e013f4cb764c6f5063fda0b215ab7e67'
         '3b409077610498e90eb7fa2ff15f2fb2')
options=('emptydirs')

DLAGENTS+=('manual::/usr/bin/echo The deb \(for Ubuntu\) files for this package needs to be downloaded manually, since it requires a login and is not redistributable.;/usr/bin/echo Please visit https://foundationdb.com/get; exit 1;')

extract_deb() {
  bsdtar -xf $1 data.tar.gz
  bsdtar -xf data.tar.gz
  rm data.tar.gz
}

build() {
  extract_deb "foundationdb-clients_${pkgver}-${pkgrel}_amd64.deb"
  extract_deb "foundationdb-server_${pkgver}-${pkgrel}_amd64.deb"

  sed -e 's|group = foundationdb|group = daemon|' -i "$srcdir"/etc/foundationdb/foundationdb.conf

  rm -rf "$srcdir/etc/init.d"
}

package() {
  cp -R "$srcdir"/{etc,usr} "$pkgdir"/

  install -d -m775 "$pkgdir"/var/lib/foundationdb
  install -d -m775 "$pkgdir"/var/log/foundationdb
  install -d -m775 "$pkgdir"/usr/share/licenses/$pkgname

  install -Dm644 "$srcdir/foundationdb.service" "$pkgdir/usr/lib/systemd/system/foundationdb.service"
  install -Dm644 "$srcdir"/CommunityLicenseAgreement.pdf "$pkgdir"/usr/share/licenses/$pkgname/CommunityLicenseAgreement.pdf
}
