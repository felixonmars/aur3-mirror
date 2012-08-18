# Maintainer: Isaac Aronson <i@pingas.org>
pkgname=iodined-systemd
pkgver=0.6.0_rc1
pkgrel=2
pkgdesc="Systemd unit files for hosting an iodine server"
url="http://code.kryo.se/iodine"
arch=('i686' 'x86_64')
license=('custom: ISC')
backup=('etc/conf.d/iodined')
install=iodined.install
conflicts=('iodine')
provides=('iodine')
source=(http://code.kryo.se/iodine/iodine-0.6.0-rc1.tar.gz
        iodined.service
        iodined.conf)
md5sums=('a15bb4faba020d217016fde6e231074a'
         'bbcb3adbb7605c3e629424fd14c9769c'
         '6f130bce4dad1255f018039649e73e2c')


build() {
  cd $srcdir/iodine-0.6.0-rc1
  make
}

package() {
  cd $srcdir/iodine-0.6.0-rc1
  make prefix=/usr DESTDIR=$pkgdir install
  install -d $pkgdir/usr/share/licenses/iodine
  sed -n '/AUTHORS & LICENSE/,$p' README > $pkgdir/usr/share/licenses/iodine/LICENSE
  install -Dm600 "../iodined.conf" "$pkgdir/etc/conf.d/iodined"
  install -Dm644 "../iodined.service" "$pkgdir/usr/lib/systemd/system/iodined.service"
}
