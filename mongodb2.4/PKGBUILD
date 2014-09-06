# Maintainer: Guillaume Bodi <bodi.giyomu at gmail.com>

pkgname=mongodb2.4
pkgver=2.4.11
pkgrel=1
pkgdesc='Version 2.4.* of MongoDB, with all binaries versioned as well so you may have it coexist on your system with later versions'
arch=('x86_64')
url='http://www.mongodb.org'
license=('AGPL3')
depends=('pcre' 'snappy' 'openssl' 'gperftools' 'libsasl' 'boost-libs')
checkdepends=('python2-pymongo')
optdepends=('libpcap: needed for mongosniff')
backup=('etc/mongodb2.4.conf')
install=mongodb.install
source=("https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-${pkgver}.tgz"
        'mongodb.conf' 'mongodb.service')

package() {
  install -Dm644 "$srcdir/mongodb.conf" "$pkgdir/etc/mongodb2.4.conf"
  install -Dm644 "$srcdir/mongodb.service" "$pkgdir/usr/lib/systemd/system/mongodb2.4.service"
  install -dm700 "$pkgdir/var/lib/mongodb2.4"
  install -dm755 "$pkgdir/var/log/mongodb2.4"

  cp -r "$srcdir/mongodb-linux-x86_64-${pkgver}/bin" "$pkgdir/usr"
  for _i in $(ls "$pkgdir/usr/bin")
  do
    mv "$pkgdir/usr/bin/$_i" "$pkgdir/usr/bin/${_i}2.4"
  done
}
md5sums=('9c63b8dafdc091344f2b5cc8e9ccd31e'
         'c61bbdf47f030d014eabbf1ee26fe9a8'
         '90675f0f38107d7dd6b1410db9bab2bd')
